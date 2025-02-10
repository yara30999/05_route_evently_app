import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../01_introduction_screen/view_model/theme_provider.dart';
import '../../../../../resourses/assets_manager.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/styles_manager.dart';

class ThemeDropdown extends StatelessWidget {
  const ThemeDropdown({super.key});

  // Define the language options
  List<DropdownMenuItem<ThemeMode>> get themeOptions => [
        DropdownMenuItem(
          value: ThemeMode.light,
          child: Row(
            spacing: 16,
            children: [
              Icon(
                Icons.sunny,
                color: ColorsManager.blue,
              ),
              Text(tr('light')),
            ],
          ),
        ),
        DropdownMenuItem(
          value: ThemeMode.dark,
          child: Row(
            spacing: 16,
            children: [
              Icon(
                Icons.nightlight_round,
                color: ColorsManager.blue,
              ),
              Text(tr('dark')),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManager.blue,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<ThemeMode>(
        value: Provider.of<ThemeProvider>(context).themeMode,
        items: themeOptions,
        onChanged: (ThemeMode? newTheme) {
          if (newTheme != null) {
            Provider.of<ThemeProvider>(context, listen: false).setTheme();
          }
        },
        borderRadius: BorderRadius.all(Radius.circular(16)), //for dropdown menu
        underline: Container(), // Remove the default underline
        icon: SvgPicture.asset(SvgAssets.dropdownArrow, width: 16),
        style: Styles.style24Bold().copyWith(color: ColorsManager.blue),
        isExpanded: true, // Make the dropdown take full width
      ),
    );
  }
}
