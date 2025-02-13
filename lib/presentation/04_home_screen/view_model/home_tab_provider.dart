import 'package:flutter/material.dart';
import '../../../app/extentions.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/usecase/events_usecase.dart';

class HomeTabProvider extends ChangeNotifier {
  final EventsUsecase eventsUsecase;
  HomeTabProvider(this.eventsUsecase);

  int categoryIndex = 0;
  CategoryItems categoryItem = CategoryItems.values.first;

  void onCategorySelection(int index) {
    categoryIndex = index;
    notifyListeners();
  }

  Stream<List<EventEntity>> streamEvents() {
    return eventsUsecase.execute().map((events) {
      if (categoryIndex == 0) {
        // Return all events if categoryIndex is 0
        return events;
      } else {
        // filteration based on categoryIndex
        return events
            .where((event) => event.categoryId == categoryIndex)
            .toList();
      }
    });
  }
}
