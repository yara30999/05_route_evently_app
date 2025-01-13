import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:country_flags/country_flags.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/language_manager.dart';

class LanguageToggleSwitch extends StatefulWidget {
  const LanguageToggleSwitch({super.key});

  @override
  LanguageToggleSwitchState createState() => LanguageToggleSwitchState();
}

class LanguageToggleSwitchState extends State<LanguageToggleSwitch> {
  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.rolling(
      current: isEnglish,
      iconOpacity:
          1, //showing the exact color of unselected items without opacity
      height: 30.0, //total height
      indicatorSize: Size.fromWidth(30.0), //indicator width & height
      spacing: 10, // between each item in the switch
      borderWidth: 2.0,
      style: ToggleStyle(
          borderColor: ColorsManager.blue, // Custom border color
          backgroundColor: Colors.transparent,
          indicatorBorder: Border.all(color: ColorsManager.blue, width: 2),
          indicatorColor: ColorsManager.blue),
      values: const [true, false],
      iconBuilder: (value, foreground) {
        return value
            ? CountryFlag.fromCountryCode(
                LanguageType.english.getCountryCode(),
                shape: const Circle(),
                height: 20,
                width: 20,
              )
            : CountryFlag.fromCountryCode(
                LanguageType.arabic.getCountryCode(),
                shape: const Circle(),
                height: 20,
                width: 20,
              );
      },
      onChanged: (value) {
        setState(() => isEnglish = value);
        isEnglish
            ? context.setLocale(LocalizationUtils.englishLocal)
            : context.setLocale(LocalizationUtils.arabicLocal);
      },
    );
  }
}
