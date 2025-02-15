import 'package:dartz/dartz.dart';
import '../../app/app_prefs.dart';
import '../../domain/entities/auth_entity.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/repository/repository.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../mappers/mappers.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';
import '../network/requests.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;
  RepositoryImpl(this._remoteDataSource, this._networkInfo,
      this._localDataSource, this._appPreferences);

  @override
  Future<Either<Failure, AuthenticationEntity>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final AuthenticationEntity authenticationEntity =
            await _remoteDataSource.login(loginRequest);
        await _localDataSource.saveUserDataToCache(authenticationEntity);
        await _appPreferences.setUserLoggedIn();
        return Right(authenticationEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // return internet connection error
      // return either left
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthenticationEntity authenticationEntity =
            await _remoteDataSource.register(registerRequest);
        await _localDataSource.saveUserDataToCache(authenticationEntity);
        await _appPreferences.setUserLoggedIn();
        return Right(authenticationEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AuthenticationEntity>> googleSignIn() async {
    if (await _networkInfo.isConnected) {
      try {
        final AuthenticationEntity authenticationEntity =
            await _remoteDataSource.googleSignIn();
        await _localDataSource.saveUserDataToCache(authenticationEntity);
        await _appPreferences.setUserLoggedIn();
        return Right(authenticationEntity);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.logout();
        await _localDataSource.clearAllCachedBoxes();
        await _appPreferences.removePrefs();
        return const Right(true);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        await _remoteDataSource.forgotPassword(email);
        return const Right(true);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addEvent(
      AddEventRequest addEventRequest) async {
    try {
      await _remoteDataSource.addEvent(addEventRequest);
      return const Right(true);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Stream<List<EventEntity>> getEvents() {
    return _remoteDataSource.getEvents().map((eventResponses) {
      // Map each EventResponse to EventEntity
      return eventResponses
          .map((eventResponse) => eventResponse.toDomain())
          .toList();
    });
  }

  @override
  Future<Either<Failure, bool>> toggleFavourite(
      UpdateLikeRequest updateLikeRequest) async {
    try {
      await _remoteDataSource.toggleFavourite(updateLikeRequest);
      return const Right(true);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> updateEvent(
      UpdateEventRequest updateEventRequest) async {
    try {
      await _remoteDataSource.updateEvent(updateEventRequest);
      return const Right(true);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }

  @override
  Future<Either<Failure, bool>> deleteEvent(String eventId) async {
    try {
      await _remoteDataSource.deleteEvent(eventId);
      return const Right(true);
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
