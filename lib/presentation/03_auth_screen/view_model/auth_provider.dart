import 'package:flutter/material.dart';
import '../../../../app/di.dart';
import '../../../../data/data_source/local_data_source.dart';
import '../../../../domain/usecase/forgot_password_usecase.dart';
import '../../../../domain/usecase/google_sign_in_usecase.dart';
import '../../../../domain/usecase/login_usecase.dart';
import '../../../../domain/usecase/logout_usecase.dart';
import '../../../../domain/usecase/register_usecase.dart';
import '../../../domain/entities/auth_entity.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;
  final RegisterUsecase _registerUseCase;
  final LogoutUsecase _logoutUseCase;
  final GoogleSignInUseCase _googleSignInUseCase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final LocalDataSource _localDataSource = instance();

  AuthProvider(this._loginUseCase, this._registerUseCase, this._logoutUseCase,
      this._googleSignInUseCase, this._forgotPasswordUsecase) {
    // Initialize authObj in the constructor body
    //it can be actual user data or dummy data if the user data is null
    _authObj = _localDataSource.fetchUserData();
  }

  AuthenticationEntity? _authObj;
  bool _isLoading = false;
  bool _isGoogleLoading = false;
  String? _errorMessage;

  AuthenticationEntity? get authObj => _authObj;
  bool get isLoading => _isLoading;
  bool get isGoogleLoading => _isGoogleLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setGoogleLoading(bool value) {
    _isGoogleLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> loginUser(String email, String password) async {
    _setLoading(true);
    var result =
        await _loginUseCase.execute(LoginUseCaseInput(email, password));
    result.fold((failure) {
      _setErrorMessage('${failure.message} ${failure.code}');
    }, (authEntity) {
      _authObj = authEntity;
      _setErrorMessage(null);
    });
    _setLoading(false);
  }

  Future<void> registerUser(
      String userName, String email, String password) async {
    _setLoading(true);
    var result = await _registerUseCase
        .execute(RegisterUseCaseInput(userName, email, password));
    result.fold((failure) {
      _setErrorMessage('${failure.message} ${failure.code}');
    }, (authEntity) {
      _authObj = authEntity;
      _setErrorMessage(null);
    });
    _setLoading(false);
  }

  Future<void> googleSignIn() async {
    _setGoogleLoading(true);
    var result = await _googleSignInUseCase.execute();
    result.fold((failure) {
      _setErrorMessage('${failure.message} ${failure.code}');
    }, (authEntity) {
      _authObj = authEntity;
      _setErrorMessage(null);
    });
    _setGoogleLoading(false);
  }

  Future<void> logout() async {
    _setLoading(true);
    var result = await _logoutUseCase.execute();
    result.fold((failure) {
      _setErrorMessage('${failure.message} ${failure.code}');
    }, (_) {
      _authObj = null;
      _setErrorMessage(null);
    });
    _setLoading(false);
  }

  Future<void> forgotPassword(String email) async {
    _setLoading(true);
    var result = await _forgotPasswordUsecase.execute(email);
    result.fold((failure) {
      _setErrorMessage('${failure.message} ${failure.code}');
    }, (_) {
      _setErrorMessage(null);
    });
    _setLoading(false);
  }
}
