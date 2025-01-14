import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../01_introduction_screen/view_model/theme_provider.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/routes_manager.dart';
import '../../resourses/styles_manager.dart';
import 'widgets/arrow_circle.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  void onDone(BuildContext context) {
    AppPreferencesImpl(instance()).setOnboardingSeen();
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  Widget build(BuildContext context) {
    var dotsDecoration = DotsDecorator(
      size: const Size.square(10.0),
      activeSize: const Size(20.0, 10.0),
      activeColor: ColorsManager.blue,
      color: ColorsManager.black,
      spacing: const EdgeInsets.symmetric(horizontal: 5.0),
      activeShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
    );
    var pageDecoration = PageDecoration(
        imageFlex: 2,
        bodyFlex: 1,
        footerFlex: 0,
        titleTextStyle:
            Styles.style20Bold().copyWith(color: ColorsManager.blue),
        bodyTextStyle: Styles.style16Medium(),
        bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.transparent,
        imagePadding: EdgeInsets.zero,
        footerPadding: EdgeInsets.zero);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(PngAssets.appLogo),
      ),
      body: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        dotsFlex: 2,
        dotsDecorator: dotsDecoration,
        showNextButton: true,
        showBackButton: true,
        showDoneButton: true,
        back: ArrowCircle(),
        next: ArrowCircle(isForward: true),
        done: ArrowCircle(isForward: true),
        onDone: () {
          onDone(context);
        },
        pages: [
          PageViewModel(
            title: context.tr('onboarding_title_1'),
            body: context.tr('onboarding_body_1'),
            image: Image.asset(
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                  ? PngAssets.onboarding1
                  : PngAssets.onboarding1Dark,
              width: double.infinity,
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: context.tr('onboarding_title_2'),
            body: context.tr('onboarding_body_2'),
            image: Image.asset(
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                  ? PngAssets.onboarding2
                  : PngAssets.onboarding2Dark,
              width: double.infinity,
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: context.tr('onboarding_title_3'),
            body: context.tr('onboarding_body_3'),
            image: Image.asset(
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.light
                  ? PngAssets.onboarding3
                  : PngAssets.onboarding3Dark,
              width: double.infinity,
            ),
            decoration: pageDecoration,
          ),
        ],
      ),
    );
  }
}
