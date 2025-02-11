import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../app/extentions.dart';

class CreateEventProvider extends ChangeNotifier {
  CategoryItems categoryItem = CategoryItems.values.first;
  int categoryIndex = 0;
  String? formattedDate;
  String? formattedTime;
  LatLng? currentUserLocation;
  LatLng? selectedLocation;

  void onCategorySelection(int index) {
    categoryItem = CategoryItems.values[index];
    categoryIndex = index;
    notifyListeners();
  }

  void onDateSelection(DateTime date) {
    formattedDate = DateFormat('dd/MM/yyyy').format(date);
    notifyListeners();
  }

  void onTimeSelection(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    formattedTime = DateFormat('hh:mm a').format(dt);
    notifyListeners();
  }

  void onLocationSelection(LatLng latlng) {
    selectedLocation = latlng;
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
    currentUserLocation = LatLng(position.latitude, position.longitude);
  }
}
