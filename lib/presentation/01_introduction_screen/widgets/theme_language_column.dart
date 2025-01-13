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
          label: 'language',
          isLanguage: true,
        ),
        SettingRow(
          label: 'Theme',
          isLanguage: false,
        ),
      ],
    );
  }
}
