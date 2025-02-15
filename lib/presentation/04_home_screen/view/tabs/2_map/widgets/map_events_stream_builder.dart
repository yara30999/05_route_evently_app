import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../domain/entities/event_entity.dart';
import '../../../../view_model/map_tab_provider.dart';
import '../../../widgets/state_widgets/empty_state_widget.dart';
import '../../../widgets/state_widgets/error_state_widget.dart';
import 'events_horizontal_list_view_builder.dart';

class MapEventsStreamBuilder extends StatelessWidget {
  const MapEventsStreamBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EventEntity>>(
      stream: context.read<MapTabProvider>().streamEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return ErrorStateWidget(
            width: 30,
            errorText: context
                .tr('failedToLoadEvents', args: [snapshot.error.toString()]),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return EmptyStateWidget(width: 25, label: context.tr('no_events'));
        } else {
          return EventsHorizontalListViewBuilder(
            items: snapshot.data!,
          );
        }
      },
    );
  }
}
