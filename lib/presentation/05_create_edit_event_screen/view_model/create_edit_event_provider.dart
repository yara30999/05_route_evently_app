import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../app/extentions.dart';
import '../../../data/network/network_info.dart';
import '../../../domain/usecase/add_event_usecase.dart';
import '../../../domain/usecase/update_event_usecase.dart';

class CreateEditEventProvider extends ChangeNotifier {
  final NetworkInfo _networkInfo;
  final AddEventUsecase _addEventUsecase;
  final UpdateEventUsecase _updateEventUsecase;

  CreateEditEventProvider(
      this._networkInfo, this._addEventUsecase, this._updateEventUsecase,
      {this.categoryIndex,
      this.categoryItem,
      this.formattedDate,
      this.formattedTime,
      this.selectedLocation}) {
    categoryIndex = categoryIndex ?? 1;
    categoryItem = categoryItem ?? CategoryItems.values[1];
  }

  int? categoryIndex;
  CategoryItems? categoryItem;
  String? formattedDate;
  String? formattedTime;
  LatLng? currentUserLocation;
  LatLng? selectedLocation;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> addEvent(String title, String description) async {
    _setLoading(true);
    formattedDate ??= DateFormat('dd/MM/yyyy').format(DateTime.now());
    formattedTime ??= DateFormat('hh:mm a').format(DateTime.now());
    if (selectedLocation == null) {
      _setErrorMessage('you_have_to_pick_location'.tr());
      _setLoading(false);
      return; //break the function.
    }
    bool isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      _setLoading(false);
    }
    var result = await _addEventUsecase.execute(AddEventUseCaseInput(
        categoryIndex!,
        title,
        description,
        formattedDate!,
        formattedTime!,
        selectedLocation?.latitude ?? 22.0, //for more protection
        selectedLocation?.longitude ?? 21.0, //for more protection
        false));
    result.fold((failure) {
      _setErrorMessage('${failure.message} ${failure.code}');
    }, (isSuceess) {
      _setErrorMessage(null);
    });
    _setLoading(false);
  }

  Future<void> updateEvent(
      String eventId, String title, String description, bool isLiked) async {
    _setLoading(true);
    formattedDate ??= DateFormat('dd/MM/yyyy').format(DateTime.now());
    formattedTime ??= DateFormat('hh:mm a').format(DateTime.now());
    if (selectedLocation == null) {
      _setErrorMessage('you_have_to_pick_location'.tr());
      _setLoading(false);
      return; //break the function.
    }
    bool isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      _setLoading(false);
    }
    var result = await _updateEventUsecase.execute(UpdateEventUseCaseInput(
        eventId,
        categoryIndex!,
        title,
        description,
        formattedDate!,
        formattedTime!,
        selectedLocation?.latitude ?? 22.0, //for more protection
        selectedLocation?.longitude ?? 21.0, //for more protection
        isLiked));
    result.fold((failure) {
      _setErrorMessage('${failure.message} ${failure.code}');
    }, (isSuceess) {
      _setErrorMessage(null);
    });
    _setLoading(false);
  }

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
