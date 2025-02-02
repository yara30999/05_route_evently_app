import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/auth_entity.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationEntity>> login(
      LoginRequest loginRequest);
  Future<Either<Failure, bool>> forgotPassword(String email);
  Future<Either<Failure, AuthenticationEntity>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, AuthenticationEntity>> googleSignIn();
  Future<Either<Failure, bool>> logout();
}
