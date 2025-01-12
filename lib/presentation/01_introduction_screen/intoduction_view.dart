import 'package:flutter/material.dart';

import '../resourses/assets_manager.dart';
import '../resourses/colors_manager.dart';
import '../resourses/styles_manager.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Image.asset(PngAssets.appLogo),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 28,
          children: [
            Spacer(),
            Image.asset(
              PngAssets.introImg,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              'Personalize Your Experience',
              style: Styles.style20Bold().copyWith(color: ColorsManager.blue),
            ),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: Styles.style16Medium(),
            ),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
        child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Let’s Start",
            )),
      ),
    );
  }
}
