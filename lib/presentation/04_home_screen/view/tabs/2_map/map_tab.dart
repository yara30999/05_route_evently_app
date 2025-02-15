import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/di.dart';
import '../../../view_model/map_tab_provider.dart';
import 'widgets/google_map_for_events.dart';
import 'widgets/map_events_stream_builder.dart';
import 'widgets/user_location_button.dart';

class MapTab extends StatelessWidget {
  const MapTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapTabProvider(instance()),
      builder: (context, child) {
        return Stack(
          children: [
            GoogleMapForEvents(),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 120,
                child: MapEventsStreamBuilder(),
              ),
            ),
            Positioned(
              top: 40,
              right: 10,
              child: UserLocationButton(),
            ),
          ],
        );
      },
    );
  }
}
