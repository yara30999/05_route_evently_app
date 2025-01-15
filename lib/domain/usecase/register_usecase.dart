import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../entities/auth_entity.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class RegisterUsecase
    implements BaseUseCase<RegisterUseCaseInput, AuthenticationEntity> {
  final Repository _repository;

  RegisterUsecase(this._repository);

  @override
  Future<Either<Failure, AuthenticationEntity>> execute(
      [RegisterUseCaseInput? input]) async {
    //we can handle some permesions here in each usecase before execute the repo methods.
    return await _repository.register(
        RegisterRequest(input!.userName, input.email, input.password));
  }
}

class RegisterUseCaseInput {
  String userName;
  String email;
  String password;

  RegisterUseCaseInput(this.userName, this.email, this.password);
}
