import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../presentation/resourses/assets_manager.dart';
import '../presentation/resourses/constants_manager.dart';

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

enum EventPicker { date, time }

enum CategoryItemEntity {
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

extension CategoryItemEntityExtension on CategoryItemEntity {
  String getName() {
    switch (this) {
      case CategoryItemEntity.all:
        return 'all'.tr();
      case CategoryItemEntity.birthday:
        return 'birthday'.tr();
      case CategoryItemEntity.bookClub:
        return 'book_club'.tr();
      case CategoryItemEntity.sport:
        return 'sport'.tr();
      case CategoryItemEntity.eating:
        return 'eating'.tr();
      case CategoryItemEntity.exhibition:
        return 'exhibition'.tr();
      case CategoryItemEntity.gaming:
        return 'gaming'.tr();
      case CategoryItemEntity.holiday:
        return 'holiday'.tr();
      case CategoryItemEntity.workshop:
        return 'workshop'.tr();
      case CategoryItemEntity.meeting:
        return 'meeting'.tr();
    }
  }

  String getPngImage() {
    switch (this) {
      case CategoryItemEntity.birthday:
        return PngAssets.birthday;
      case CategoryItemEntity.bookClub:
        return PngAssets.bookClub;
      case CategoryItemEntity.sport:
        return PngAssets.sport;
      case CategoryItemEntity.eating:
        return PngAssets.eating;
      case CategoryItemEntity.exhibition:
        return PngAssets.exhibition;
      case CategoryItemEntity.gaming:
        return PngAssets.gaming;
      case CategoryItemEntity.holiday:
        return PngAssets.holiday;
      case CategoryItemEntity.workshop:
        return PngAssets.workshop;
      case CategoryItemEntity.meeting:
        return PngAssets.meeting;
      default:
        return '';
    }
  }

  String getSvgIcon() {
    switch (this) {
      case CategoryItemEntity.all:
        return SvgAssets.all;
      case CategoryItemEntity.birthday:
        return SvgAssets.birthday;
      case CategoryItemEntity.bookClub:
        return SvgAssets.bookClub;
      case CategoryItemEntity.sport:
        return SvgAssets.sport;
      case CategoryItemEntity.eating:
        return SvgAssets.eating;
      case CategoryItemEntity.exhibition:
        return SvgAssets.exhibition;
      case CategoryItemEntity.gaming:
        return SvgAssets.gaming;
      case CategoryItemEntity.holiday:
        return SvgAssets.holiday;
      case CategoryItemEntity.workshop:
        return SvgAssets.workshop;
      case CategoryItemEntity.meeting:
        return SvgAssets.meeting;
    }
  }
}
