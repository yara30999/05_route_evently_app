import 'package:cloud_firestore/cloud_firestore.dart';

class EventResponse {
  final int? categoryId;
  final String? title;
  final String? description;
  final String? date;
  final String? time;
  final double? lat;
  final double? lng;
  final bool? isLiked;

  EventResponse(
      {this.categoryId,
      this.title,
      this.description,
      this.date,
      this.time,
      this.lat,
      this.lng,
      this.isLiked = false});

  factory EventResponse.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return EventResponse(
      categoryId: data?['categoryId'],
      title: data?['title'],
      description: data?['description'],
      date: data?['date'],
      time: data?['time'],
      lat: data?['lat'],
      lng: data?['lng'],
      isLiked: data?['isLiked'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (categoryId != null) "categoryId": categoryId,
      if (title != null) "title": title,
      "description": description,
      "date": date,
      "time": time,
      "lat": lat,
      "lng": lng,
      "isLiked": isLiked,
    };
  }
}
