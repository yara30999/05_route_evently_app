import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../resourses/styles_manager.dart';
import 'widgets/language_drop_down_button.dart';
import 'widgets/logout_button.dart';
import 'widgets/profile_header.dart';
import 'widgets/theme_drop_down_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  Text(
                    'language'.tr(),
                    style: Styles.style24Bold(),
                  ),
                  LanguageDropdown(),
                  Text(
                    'theme'.tr(),
                    style: Styles.style24Bold(),
                  ),
                  ThemeDropdown(),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 35),
            child: LogoutButton(),
          ),
        ),
      ],
    );
  }
}
