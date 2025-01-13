import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/routes_manager.dart';
import '../../resourses/styles_manager.dart';
import '../view_model/theme_provider.dart';
import 'widgets/theme_language_column.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset(PngAssets.appLogo),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 28,
            children: [
              SizedBox(height: 5),
              Image.asset(
                Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                    ? PngAssets.introImg
                    : PngAssets.introImgDark,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text(
                context.tr('introduction_title'),
                style: Styles.style20Bold().copyWith(color: ColorsManager.blue),
              ),
              Text(
                context.tr('introduction_description'),
                style: Styles.style16Medium(),
              ),
              ThemeLanguageColumn(),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
            },
            child: Text(
              context.tr('lets_start'),
            )),
      ),
    );
  }
}
