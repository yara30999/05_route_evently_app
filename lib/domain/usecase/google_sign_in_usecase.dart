import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../entities/auth_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class GoogleSignInUseCase implements BaseUseCase<void, AuthenticationEntity> {
  final Repository _repository;

  GoogleSignInUseCase(this._repository);

  @override
  Future<Either<Failure, AuthenticationEntity>> execute([void input]) async {
    return await _repository.googleSignIn();
  }
}
