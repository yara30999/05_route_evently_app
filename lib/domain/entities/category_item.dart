import 'package:easy_localization/easy_localization.dart';

import '../../presentation/resourses/assets_manager.dart';

class CategoryItemEntity {
  final int index;
  final String name;
  final String pngImage;
  final String svgIcon;

  const CategoryItemEntity(
      {required this.name,
      required this.pngImage,
      required this.index,
      required this.svgIcon});

  static List<CategoryItemEntity> get items => [
        CategoryItemEntity(
            index: 0, name: 'all'.tr(), pngImage: '', svgIcon: SvgAssets.all),
        CategoryItemEntity(
            index: 1,
            name: 'birthday'.tr(),
            pngImage: PngAssets.birthday,
            svgIcon: SvgAssets.birthday),
        CategoryItemEntity(
            index: 2,
            name: 'book_club'.tr(),
            pngImage: PngAssets.bookClub,
            svgIcon: SvgAssets.bookClub),
        CategoryItemEntity(
            index: 3,
            name: 'sport'.tr(),
            pngImage: PngAssets.sport,
            svgIcon: SvgAssets.sport),
        CategoryItemEntity(
            index: 4,
            name: 'eating'.tr(),
            pngImage: PngAssets.eating,
            svgIcon: SvgAssets.eating),
        CategoryItemEntity(
            index: 5,
            name: 'exhibition '.tr(),
            pngImage: PngAssets.exhibition,
            svgIcon: SvgAssets.exhibition),
        CategoryItemEntity(
            index: 6,
            name: 'gaming'.tr(),
            pngImage: PngAssets.gaming,
            svgIcon: SvgAssets.gaming),
        CategoryItemEntity(
            index: 7,
            name: 'holiday'.tr(),
            pngImage: PngAssets.holiday,
            svgIcon: SvgAssets.holiday),
        CategoryItemEntity(
            index: 8,
            name: 'workshop'.tr(),
            pngImage: PngAssets.workshop,
            svgIcon: SvgAssets.workshop),
        CategoryItemEntity(
            index: 9,
            name: 'meeting'.tr(),
            pngImage: PngAssets.meeting,
            svgIcon: SvgAssets.meeting),
      ];
}
