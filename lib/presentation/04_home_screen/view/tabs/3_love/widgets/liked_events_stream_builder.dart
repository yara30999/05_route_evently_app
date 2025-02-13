import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../domain/entities/event_entity.dart';
import '../../../../view_model/love_tab_provider.dart';
import '../../../widgets/events_list_view_builder.dart';
import '../../../widgets/state_widgets/empty_state_widget.dart';
import '../../../widgets/state_widgets/error_state_widget.dart';

class LikedEventsStreamBuilder extends StatelessWidget {
  const LikedEventsStreamBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EventEntity>>(
      stream: context.watch<LoveTabProvider>().streamEvents(),
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
