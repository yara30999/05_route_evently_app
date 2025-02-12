import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../../app/functions.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/language_manager.dart';
import '../../../../../resourses/styles_manager.dart';

class LanguageIconButton extends StatelessWidget {
  const LanguageIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var initialText = LocalizationUtils.isCurrentLocalAr(context) ? "EN" : "AR";
    return InkWell(
      onTap: () {
        LocalizationUtils.isCurrentLocalAr(context)
            ? context.setLocale(LocalizationUtils.englishLocal)
            : context.setLocale(LocalizationUtils.arabicLocal);
        initialText = LocalizationUtils.isCurrentLocalAr(context) ? "EN" : "AR";
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          initialText,
          style: Styles.style24Bold().copyWith(
              color: isLightTheme(context)
                  ? ColorsManager.blue
                  : ColorsManager.darkBlue),
        ),
      ),
    );
  }
}
