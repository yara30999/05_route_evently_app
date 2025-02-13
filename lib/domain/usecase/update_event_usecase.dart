import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';
import '../repository/repository.dart';
import 'base_usecase.dart';

class UpdateEventUsecase implements BaseUseCase<UpdateEventUseCaseInput, bool> {
  final Repository _repository;

  UpdateEventUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> execute(
      [UpdateEventUseCaseInput? input]) async {
    return await _repository.updateEvent(UpdateEventRequest(
      id: input!.id,
      categoryId: input.categoryId,
      title: input.title,
      description: input.description,
      date: input.date,
      time: input.time,
      lat: input.lat,
      lng: input.lng,
      isLiked: input.isLiked,
    ));
  }
}

class UpdateEventUseCaseInput {
  final String id;
  final int categoryId;
  final String title;
  final String description;
  final String date;
  final String time;
  final double lat;
  final double lng;
  final bool isLiked;

  UpdateEventUseCaseInput(this.id, this.categoryId, this.title,
      this.description, this.date, this.time, this.lat, this.lng, this.isLiked);
}
