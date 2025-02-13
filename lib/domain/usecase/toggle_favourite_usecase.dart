import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class ToggleFavouriteUsecase
    implements BaseUseCase<ToggleFavouritesUseCaseInput, bool> {
  final Repository _repository;

  ToggleFavouriteUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
      [ToggleFavouritesUseCaseInput? input]) async {
    return await _repository
        .toggleFavourite(UpdateLikeRequest(input!.eventId, input.isliked));
  }
}

class ToggleFavouritesUseCaseInput {
  String eventId;
  bool isliked;

  ToggleFavouritesUseCaseInput(this.eventId, this.isliked);
}
