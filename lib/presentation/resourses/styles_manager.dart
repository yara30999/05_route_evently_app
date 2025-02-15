import 'dart:ui';
import 'package:flutter/material.dart';
import 'constants_manager.dart';

class FontConstants {
  static const String fontInter = "Inter";
}

abstract class Styles {
  static TextStyle style10Regular() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 10,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style14Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style14Bold() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style16Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style16Bold() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style20Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style20Bold() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style24Bold() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle style24Medium() {
    return TextStyle(
      fontFamily: FontConstants.fontInter,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
// tharwat samy responsive font ;)
double getResponsiveFontSize({required double fontSize}) {
  double scaleFactor = getScaleFactor();
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;
  double responsiveFontSizeWithLimits =
      responsiveFontSize.clamp(lowerLimit, upperLimit);

  return responsiveFontSizeWithLimits;
}

double getScaleFactor() {
  var dispatcher = PlatformDispatcher.instance;
  var physicalWidth = dispatcher.views.first.physicalSize.width;
  var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  double width = physicalWidth / devicePixelRatio;

  if (width < AppConstants.breakPointMobileTablet) {
    return width / 550;
  } else if (width < AppConstants.breakPointTabletLaptop) {
    return width / 1000;
  } else {
    return width / 1920;
  }
}
