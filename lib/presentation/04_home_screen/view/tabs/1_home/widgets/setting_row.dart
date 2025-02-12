import 'package:flutter/material.dart';
import 'language_icon_button.dart';
import 'theme_icon_button.dart';

class SettingsRow extends StatelessWidget {
  const SettingsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ThemeAnimatedIconButton(),
        LanguageIconButton(),
      ],
    );
  }
}
