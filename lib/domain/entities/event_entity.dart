class EventEntity {
  final String id;
  final int categoryId;
  final String title;
  final String description;
  final String date;
  final String time;
  final double lat;
  final double lng;
  final bool isLiked;

  EventEntity(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.description,
      required this.date,
      required this.time,
      required this.lat,
      required this.lng,
      required this.isLiked});
}
