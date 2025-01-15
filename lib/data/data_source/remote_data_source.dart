import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../app/extentions.dart';
import '../../domain/entities/auth_entity.dart';
import '../../presentation/resourses/constants_manager.dart';
import '../network/requests.dart';

abstract class RemoteDataSource {
  Future<AuthenticationEntity> login(LoginRequest loginRequest);
  Future<void> forgotPassword(String email);
  Future<AuthenticationEntity> register(RegisterRequest registerRequest);
  Future<AuthenticationEntity> googleSignIn();
  Future<void> logout();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  RemoteDataSourceImpl(this._firebaseAuth);
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<AuthenticationEntity> login(LoginRequest loginRequest) async {
    final UserCredential credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.email,
      password: loginRequest.password,
    );
    //read doc
    DocumentSnapshot userData = await users.doc(credential.user?.uid).get();
    return AuthenticationEntity(
        uid: credential.user!.uid,
        name: userData['name'],
        email: userData['email']);
  }

  @override
  Future<AuthenticationEntity> register(RegisterRequest registerRequest) async {
    final UserCredential credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: registerRequest.email,
      password: registerRequest.password,
    );
    //write doc
    await users.doc(credential.user?.uid).set(
        {'name': registerRequest.userName, 'email': registerRequest.email});
    return AuthenticationEntity(
        uid: credential.user!.uid,
        name: registerRequest.userName,
        email: registerRequest.email);
  }

  @override
  Future<AuthenticationEntity> googleSignIn() async {
    UserCredential userCredential;

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw StateError(AppConstants.google);
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    userCredential = await _firebaseAuth.signInWithCredential(credential);
    return AuthenticationEntity(
      uid: userCredential.user!.uid,
      name: userCredential.user!.displayName.orEmpty(),
      email: userCredential.user!.email.orEmpty(),
    );
  }

  @override
  Future<void> logout() async {
    if (_googleSignIn.currentUser != null) {
      // If a user is signed in via google
      await _googleSignIn.disconnect();
    }
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
