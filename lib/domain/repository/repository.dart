import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/auth_entity.dart';
import '../entities/event_entity.dart';

abstract class Repository {
  Future<Either<Failure, AuthenticationEntity>> login(
      LoginRequest loginRequest);
  Future<Either<Failure, bool>> forgotPassword(String email);
  Future<Either<Failure, AuthenticationEntity>> register(
      RegisterRequest registerRequest);
  Future<Either<Failure, AuthenticationEntity>> googleSignIn();
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, bool>> addEvent(AddEventRequest addEventRequest);
  Future<Either<Failure, bool>> updateEvent(
      UpdateEventRequest updateEventRequest);
  Stream<List<EventEntity>> getEvents();
  Future<Either<Failure, bool>> toggleFavourite(
      UpdateLikeRequest updateLikeRequest);
}
