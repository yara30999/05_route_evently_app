import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../app/extentions.dart';
import '../../domain/entities/auth_entity.dart';
import '../../presentation/resourses/constants_manager.dart';
import '../network/requests.dart';
import '../responses/event_response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationEntity> login(LoginRequest loginRequest);
  Future<void> forgotPassword(String email);
  Future<AuthenticationEntity> register(RegisterRequest registerRequest);
  Future<AuthenticationEntity> googleSignIn();
  Future<void> logout();
  Future<void> addEvent(AddEventRequest addEventRequest);
  Stream<List<EventResponse>> getEvents();
  Future<void> toggleFavourite(UpdateLikeRequest updateLikeRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  CollectionReference events = FirebaseFirestore.instance.collection('events');
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  RemoteDataSourceImpl(this._firebaseAuth);

  @override
  Future<AuthenticationEntity> login(LoginRequest loginRequest) async {
    final UserCredential credential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.email,
      password: loginRequest.password,
    );

    return AuthenticationEntity(
        uid: credential.user!.uid,
        name: credential.user!.displayName.orEmpty(),
        email: credential.user!.email.orEmpty());
  }

  @override
  Future<AuthenticationEntity> register(RegisterRequest registerRequest) async {
    final UserCredential credential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: registerRequest.email,
      password: registerRequest.password,
    );

    // Update user's profile with displayName
    await credential.user?.updateDisplayName(registerRequest.userName);

    // Optionally, reload the user to get updated info
    await credential.user?.reload();

    //return the AuthenticationEntity with updated data.
    return AuthenticationEntity(
        uid: credential.user!.uid,
        name: credential.user!.displayName.orEmpty(),
        email: credential.user!.email.orEmpty());
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

  @override
  Future<void> addEvent(AddEventRequest addEventRequest) async {
    String currentUserId = _firebaseAuth.currentUser?.uid ?? "";
    //write doc
    await events.doc().set(EventResponse(
          userId: currentUserId,
          categoryId: addEventRequest.categoryId,
          title: addEventRequest.title,
          description: addEventRequest.description,
          date: addEventRequest.date,
          time: addEventRequest.time,
          lat: addEventRequest.lat,
          lng: addEventRequest.lng,
          isLiked: addEventRequest.isLiked,
        ).toFirestore());
  }

  @override
  Stream<List<EventResponse>> getEvents() {
    String currentUserId = _firebaseAuth.currentUser?.uid ?? "";
    return events
        .snapshots() // Listen to the collection as a stream
        .map((QuerySnapshot snapshot) {
      return snapshot.docs
          .map((doc) => EventResponse.fromFirestore(
              doc as DocumentSnapshot<Map<String, dynamic>>))
          // to get a specific user events only
          .where((event) => event.userId!.contains(currentUserId))
          .toList();
    });
  }

  @override
  Future<void> toggleFavourite(UpdateLikeRequest updateLikeRequest) async {
    //update doc
    await events
        .doc(updateLikeRequest.eventId)
        .update({'isLiked': updateLikeRequest.isLiked});
  }
}
