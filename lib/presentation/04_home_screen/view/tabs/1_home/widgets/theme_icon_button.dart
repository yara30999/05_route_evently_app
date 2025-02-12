import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/functions.dart';
import '../../../../../01_introduction_screen/view_model/theme_provider.dart';
import '../../../../../resourses/colors_manager.dart';

class ThemeAnimatedIconButton extends StatelessWidget {
  const ThemeAnimatedIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var initialIcon = isLightTheme(context) ? 0 : 1;
    return AnimatedIconButton(
      duration: const Duration(milliseconds: 200),
      initialIcon: initialIcon,
      onPressed: () {
        Provider.of<ThemeProvider>(context, listen: false).setTheme();
      },
      icons: [
        AnimatedIconItem(
          icon: Icon(
            Icons.sunny,
            color: ColorsManager.white,
          ),
        ),
        AnimatedIconItem(
          icon: Icon(
            Icons.nightlight_round,
            color: ColorsManager.white,
          ),
        ),
      ],
    );
  }
}
