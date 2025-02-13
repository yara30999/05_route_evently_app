import '../../app/extentions.dart';
import '../../domain/entities/event_entity.dart';
import '../responses/event_response.dart';

extension EventResponseMapper on EventResponse? {
  EventEntity toDomain() {
    return EventEntity(
      id: this!.id.orEmpty(),
      categoryId: this!.categoryId.orZero(),
      title: this!.title.orEmpty(),
      description: this!.description.orEmpty(),
      date: this!.date.orEmpty(),
      time: this!.time.orEmpty(),
      lat: this!.lat.orZero(),
      lng: this!.lng.orZero(),
      isLiked: this!.isLiked.orFalse(),
    );
  }
}
