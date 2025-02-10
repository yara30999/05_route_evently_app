import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../resourses/assets_manager.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/language_manager.dart';
import '../../../../../resourses/styles_manager.dart';

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  // Define the language options
  List<DropdownMenuItem<Locale>> get languageOptions => [
        DropdownMenuItem(
          value: LocalizationUtils.englishLocal,
          child: Row(
            spacing: 16,
            children: [
              CountryFlag.fromCountryCode(
                LanguageType.english.getCountryCode(),
                height: 20,
                width: 20,
              ),
              Text(tr('english')),
            ],
          ),
        ),
        DropdownMenuItem(
          value: LocalizationUtils.arabicLocal,
          child: Row(
            spacing: 16,
            children: [
              CountryFlag.fromCountryCode(
                LanguageType.arabic.getCountryCode(),
                height: 20,
                width: 20,
              ),
              Text(tr('arabic')),
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
      child: DropdownButton<Locale>(
        value: context.locale,
        items: languageOptions,
        onChanged: (Locale? newLocale) {
          if (newLocale != null) {
            context.setLocale(newLocale);
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
