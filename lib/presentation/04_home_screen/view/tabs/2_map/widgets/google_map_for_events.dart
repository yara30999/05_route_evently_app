import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/map_tab_provider.dart';

class GoogleMapForEvents extends StatefulWidget {
  const GoogleMapForEvents({
    super.key,
  });

  @override
  State<GoogleMapForEvents> createState() => _GoogleMapForEventsState();
}

class _GoogleMapForEventsState extends State<GoogleMapForEvents> {
  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    Provider.of<MapTabProvider>(context, listen: false).mapController =
        controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      initialCameraPosition: context.read<MapTabProvider>().cameraPosition,
      markers: context.watch<MapTabProvider>().markers,
    );
  }
}
