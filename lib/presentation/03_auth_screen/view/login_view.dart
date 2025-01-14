import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as dui;
import '../../01_introduction_screen/view/widgets/language_toggle_switch.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/language_manager.dart';
import '../../resourses/routes_manager.dart';
import 'widgets/custom_divider_with_text.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/custom_text_row.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  final _formKey = GlobalKey<FormState>();

  void login() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  void loginWithGoogle() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              right: 16,
              left: 16,
              //for the opening keyboard
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: ListView(
                shrinkWrap: true,
                children: [
                  Image.asset(
                    PngAssets.loginImg,
                    width: double.infinity,
                    height: 180,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 24),
                  CustomTextField(
                    label: 'emailLabel'.tr(),
                    inputType: TextInputType.emailAddress,
                    textDirection: dui.TextDirection.ltr,
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'passwordLabel'.tr(),
                    inputType: TextInputType.visiblePassword,
                    textDirection: dui.TextDirection.ltr,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  Align(
                    alignment: LocalizationUtils.isCurrentLocalAr(context)
                        ? Alignment.bottomLeft
                        : Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.forgotPasswordRoute);
                      },
                      child: Text(
                        'forgotPassword'.tr(),
                      ),
                    ),
                  ),
                  //login button
                  ElevatedButton(
                    onPressed: login,
                    child: Text(context.tr('loginLabel')),
                  ),
                  const SizedBox(height: 24),
                  CustomTextRow(
                    questionTxt: 'doNotHaveAccount'.tr(),
                    clickTxt: 'createAccount'.tr(),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                  ),
                  CustomDividerWithText(
                    label: 'or'.tr(),
                  ),
                  const SizedBox(height: 16),
                  //login with google button
                  ElevatedButton(
                    onPressed: loginWithGoogle,
                    style: ButtonStyle(
                        foregroundColor:
                            WidgetStatePropertyAll(ColorsManager.blue),
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).scaffoldBackgroundColor),
                        side: WidgetStatePropertyAll(
                          BorderSide(color: ColorsManager.blue, width: 2),
                        )),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(SvgAssets.google),
                        Text('loginWithGoogle'.tr())
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.sizeOf(context).width * 0.35),
                    child: LanguageToggleSwitch(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
