import 'package:flutter/material.dart';
import '../../../../../../domain/entities/event_entity.dart';
import 'event_horizontal_card.dart';

class EventsHorizontalListViewBuilder extends StatelessWidget {
  final List<EventEntity> items;
  const EventsHorizontalListViewBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return EventHorizontalCard(
          item: items[index],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(width: 16);
      },
    );
  }
}
