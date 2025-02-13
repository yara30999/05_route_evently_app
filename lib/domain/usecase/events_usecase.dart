import '../entities/event_entity.dart';
import '../repository/repository.dart';

class EventsUsecase {
  final Repository _repository;

  EventsUsecase(this._repository);

  Stream<List<EventEntity>> execute() {
    return _repository.getEvents();
  }
}
