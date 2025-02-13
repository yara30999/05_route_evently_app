import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/di.dart';
import '../../../../domain/entities/event_entity.dart';
import '../../../../domain/usecase/events_usecase.dart';
import '../../view_model/home_tab_provider.dart';
import 'state_widgets/empty_state_widget.dart';
import 'state_widgets/error_state_widget.dart';
import 'events_list_view_builder.dart';

class EventsStreamBuilder extends StatelessWidget {
  const EventsStreamBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EventEntity>>(
      stream: context.watch<HomeTabProvider>().streamEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return ErrorStateWidget(
            width: MediaQuery.sizeOf(context).width * 0.3,
            errorText: context
                .tr('failedToLoadEvents', args: [snapshot.error.toString()]),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return EmptyStateWidget(label: context.tr('no_events'));
        } else {
          return EventsListViewBuilder(
            items: snapshot.data!,
          );
        }
      },
    );
  }
}
