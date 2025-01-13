import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import '../../resourses/colors_manager.dart';

class ThemeToggleSwitch extends StatefulWidget {
  const ThemeToggleSwitch({super.key});

  @override
  ThemeToggleSwitchState createState() => ThemeToggleSwitchState();
}

class ThemeToggleSwitchState extends State<ThemeToggleSwitch> {
  bool isLightTheme = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<bool>.rolling(
      current: isLightTheme,
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
            ? Icon(
                Icons.sunny,
                color: foreground ? ColorsManager.white : ColorsManager.blue,
              )
            : Icon(
                Icons.nightlight_round,
                color: foreground ? ColorsManager.white : ColorsManager.blue,
              );
      },
      onChanged: (value) => setState(() => isLightTheme = value),
    );
  }
}
