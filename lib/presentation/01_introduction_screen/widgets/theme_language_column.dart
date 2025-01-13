import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'setting_row.dart';

class ThemeLanguageColumn extends StatelessWidget {
  const ThemeLanguageColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        SettingRow(
          label: context.tr('language'),
          isLanguage: true,
        ),
        SettingRow(
          label: context.tr('theme'),
          isLanguage: false,
        ),
      ],
    );
  }
}
