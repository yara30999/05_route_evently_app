import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../presentation/resourses/assets_manager.dart';
import '../presentation/resourses/constants_manager.dart';
import 'functions.dart';

const String light = "light_theme";
const String dark = "dark_theme";
const String system = "system_theme";

extension LanguageTypeExtension on ThemeMode {
  String getName() {
    switch (this) {
      case ThemeMode.light:
        return light;
      case ThemeMode.dark:
        return dark;
      case ThemeMode.system:
        return system;
    }
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return AppConstants.empty;
    } else {
      return this!;
    }
  }

  String toShortMonthFormat() {
    try {
      final date = DateTime.parse(orEmpty().split('/').reversed.join('-'));
      return '${date.day} ${_monthAbbreviation(date.month)}';
    } catch (e) {
      return this!; // Return the original string if parsing fails
    }
  }

  String _monthAbbreviation(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return AppConstants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return AppConstants.zeroDouble;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

enum EventPicker { date, time }

enum CategoryItems {
  all,
  birthday,
  bookClub,
  sport,
  eating,
  exhibition,
  gaming,
  holiday,
  workshop,
  meeting;
}

extension CategoryItemsExtension on CategoryItems {
  String getName() {
    switch (this) {
      case CategoryItems.all:
        return 'all'.tr();
      case CategoryItems.birthday:
        return 'birthday'.tr();
      case CategoryItems.bookClub:
        return 'book_club'.tr();
      case CategoryItems.sport:
        return 'sport'.tr();
      case CategoryItems.eating:
        return 'eating'.tr();
      case CategoryItems.exhibition:
        return 'exhibition'.tr();
      case CategoryItems.gaming:
        return 'gaming'.tr();
      case CategoryItems.holiday:
        return 'holiday'.tr();
      case CategoryItems.workshop:
        return 'workshop'.tr();
      case CategoryItems.meeting:
        return 'meeting'.tr();
    }
  }

  String getPngImage(BuildContext context) {
    switch (this) {
      case CategoryItems.birthday:
        return isLightTheme(context)
            ? PngAssets.birthday
            : PngAssets.birthdayDark;
      case CategoryItems.bookClub:
        return isLightTheme(context)
            ? PngAssets.bookClub
            : PngAssets.bookClubDark;
      case CategoryItems.sport:
        return isLightTheme(context) ? PngAssets.sport : PngAssets.sportDark;
      case CategoryItems.eating:
        return isLightTheme(context) ? PngAssets.eating : PngAssets.eatingDark;
      case CategoryItems.exhibition:
        return isLightTheme(context)
            ? PngAssets.exhibition
            : PngAssets.exhibitionDark;
      case CategoryItems.gaming:
        return isLightTheme(context) ? PngAssets.gaming : PngAssets.gamingDark;
      case CategoryItems.holiday:
        return isLightTheme(context)
            ? PngAssets.holiday
            : PngAssets.holidayDark;
      case CategoryItems.workshop:
        return isLightTheme(context)
            ? PngAssets.workshop
            : PngAssets.workshopDark;
      case CategoryItems.meeting:
        return isLightTheme(context)
            ? PngAssets.meeting
            : PngAssets.meetingDark;
      default:
        return PngAssets.birthday;
    }
  }

  String getSvgIcon() {
    switch (this) {
      case CategoryItems.all:
        return SvgAssets.all;
      case CategoryItems.birthday:
        return SvgAssets.birthday;
      case CategoryItems.bookClub:
        return SvgAssets.bookClub;
      case CategoryItems.sport:
        return SvgAssets.sport;
      case CategoryItems.eating:
        return SvgAssets.eating;
      case CategoryItems.exhibition:
        return SvgAssets.exhibition;
      case CategoryItems.gaming:
        return SvgAssets.gaming;
      case CategoryItems.holiday:
        return SvgAssets.holiday;
      case CategoryItems.workshop:
        return SvgAssets.workshop;
      case CategoryItems.meeting:
        return SvgAssets.meeting;
    }
  }
}
