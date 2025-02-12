import 'package:flutter/material.dart';
import '../../../../../../app/functions.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/language_manager.dart';
import 'home_category_section.dart';
import 'setting_row.dart';
import 'username_column.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color:
            isLightTheme(context) ? ColorsManager.blue : ColorsManager.darkBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              spacing: 10,
              children: [UserNameColumn(), SettingsRow()],
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: LocalizationUtils.isCurrentLocalAr(context) ? 16 : 0.0,
                  left: LocalizationUtils.isCurrentLocalAr(context) ? 0.0 : 16),
              child: HomeCategorySection(),
            ),
          ],
        ),
      ),
    );
  }
}
