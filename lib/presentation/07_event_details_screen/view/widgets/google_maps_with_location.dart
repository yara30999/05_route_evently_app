import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../resourses/colors_manager.dart';

class GoogleMapWithLocaion extends StatefulWidget {
  final double lat;
  final double lng;
  const GoogleMapWithLocaion({
    super.key,
    required this.lat,
    required this.lng,
  });

  @override
  State<GoogleMapWithLocaion> createState() => _GoogleMapWithLocaionState();
}

class _GoogleMapWithLocaionState extends State<GoogleMapWithLocaion> {
  late final LatLng _userCurrentLocation;
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    super.initState();
    _addCurrentUserLocationAndMarker();
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _addCurrentUserLocationAndMarker() {
    _userCurrentLocation = LatLng(widget.lat, widget.lng);
    _markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: _userCurrentLocation,
        infoWindow: InfoWindow(
          title: 'here'.tr(),
          snippet: 'this_is_your_event_location'.tr(),
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.blue),
      ),
      child: GoogleMap(
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          initialCameraPosition:
              CameraPosition(target: _userCurrentLocation, zoom: 12),
          markers: _markers),
    );
  }
}
