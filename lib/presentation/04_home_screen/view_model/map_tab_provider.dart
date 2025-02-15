import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../domain/entities/event_entity.dart';
import '../../../domain/usecase/events_usecase.dart';

class MapTabProvider extends ChangeNotifier {
  final EventsUsecase eventsUsecase;

  MapTabProvider(this.eventsUsecase);

  late final GoogleMapController mapController;

  CameraPosition cameraPosition =
      CameraPosition(target: LatLng(30.04442, 31.23571), zoom: 10);
  Set<Marker> markers = {};

  Stream<List<EventEntity>> streamEvents() {
    return eventsUsecase.execute();
  }

  void onEventSelection(LatLng latlng, String title) async {
    // Animate camera to the new event location
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latlng, zoom: 14),
      ),
    );
    // Add new marker while keeping existing markers
    markers = {
      Marker(
        markerId: MarkerId(UniqueKey().toString()),
        position: latlng,
        infoWindow: InfoWindow(
          title: 'here'.tr(),
          snippet: title,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    };
    notifyListeners();
  }

  Future<void> getCurrentUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('location_services_disabled'.tr());
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('location_permissions_denied'.tr());
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error('location_permissions_permanently_denied'.tr());
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition();
    LatLng currentUserLocation = LatLng(position.latitude, position.longitude);
    onEventSelection(currentUserLocation, 'this_is_your_location'.tr());
  }
}
