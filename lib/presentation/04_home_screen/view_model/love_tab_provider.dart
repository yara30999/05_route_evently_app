import 'package:flutter/material.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/usecase/events_usecase.dart';

class LoveTabProvider extends ChangeNotifier {
  final EventsUsecase eventsUsecase;
  LoveTabProvider(this.eventsUsecase);

  String _searchQuery = '';

  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  Stream<List<EventEntity>> streamEvents() {
    return eventsUsecase.execute().map((events) {
      if (_searchQuery.isEmpty) {
        // filteration based on favourites
        return events.where((event) => event.isLiked == true).toList();
      } else {
        // Filter based on favorites and search query
        return events
            .where((event) =>
                event.isLiked == true &&
                event.title.toLowerCase().contains(_searchQuery))
            .toList();
      }
    });
  }

  // Stream<List<EventEntity>> streamEvents() {
  //   return eventsUsecase.execute().map((events) {
  //     // filteration based on favourites
  //     return events.where((event) => event.isLiked == true).toList();
  //   });
  // }
}
