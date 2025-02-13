import 'package:flutter/material.dart';
import '../../../../domain/entities/event_entity.dart';
import 'event_card.dart';

class EventsListViewBuilder extends StatelessWidget {
  final List<EventEntity> items;
  const EventsListViewBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: items.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return EventCard(
          item: items[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 16);
      },
    );
  }
}
