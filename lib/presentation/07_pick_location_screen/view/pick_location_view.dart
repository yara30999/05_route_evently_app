import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../05_create_event_screen/view_model/create_event_provider.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/styles_manager.dart';

class PickLocationView extends StatefulWidget {
  final CreateEventProvider provider;
  const PickLocationView({super.key, required this.provider});

  @override
  State<PickLocationView> createState() => _PickLocationViewState();
}

class _PickLocationViewState extends State<PickLocationView> {
  late final LatLng? _userCurrentLocation;
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
    _userCurrentLocation = widget.provider.currentUserLocation;
    if (_userCurrentLocation != null) {
      _markers.add(
        Marker(
          markerId: MarkerId(UniqueKey().toString()),
          position: _userCurrentLocation,
          infoWindow: InfoWindow(
            title: 'you_are_here'.tr(),
            snippet: 'this_is_your_location'.tr(),
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );
    }
  }

  void _onTap(LatLng location) async {
    _markers.add(
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: location,
        infoWindow: InfoWindow(
          title: 'picked_place'.tr(),
          snippet: 'you_picked_this_location'.tr(),
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
    setState(() {}); // for marker to appear on the map :)
    widget.provider.onLocationSelection(location);
    Future.delayed(Duration(seconds: 3)).then((value) {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
            mapType: MapType.normal,
            onTap: _onTap,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
                target: _userCurrentLocation ?? LatLng(22, 21), zoom: 12),
            markers: _markers),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: ColorsManager.blue,
        child: Center(
            child: Text(
          'tap_on_location_to_select'.tr(),
          style: Styles.style20Medium().copyWith(color: ColorsManager.white),
        )),
      ),
    );
  }
}
