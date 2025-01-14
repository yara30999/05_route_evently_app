import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as dui;
import '../../../app/di.dart';
import '../../../app/validation_service.dart';
import '../../01_introduction_screen/view/widgets/language_toggle_switch.dart';
import '../../resourses/assets_manager.dart';
import 'widgets/custom_text_form_field.dart';
import 'widgets/custom_text_row.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? name;
  String? email;
  String? password;
  String? rePassword;
  final _formKey = GlobalKey<FormState>();
  final _validationService = instance<IValidationService>();

  void register() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.tr('registerLabel')),
      ),
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
                    label: 'usernameLabel'.tr(),
                    inputType: TextInputType.name,
                    textDirection: dui.TextDirection.ltr,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
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
                  const SizedBox(height: 24),
                  CustomTextField(
                    label: 'rePasswordLabel'.tr(),
                    inputType: TextInputType.visiblePassword,
                    textDirection: dui.TextDirection.ltr,
                    onChanged: (value) {
                      setState(() {
                        rePassword = value;
                      });
                    },
                    customValidator: (value) {
                      return _validationService.validateConfirmPassword(
                          value, password);
                    },
                  ),
                  const SizedBox(height: 24),
                  //register button
                  ElevatedButton(
                    onPressed: register,
                    child: Text(context.tr('createAccount')),
                  ),
                  const SizedBox(height: 10),
                  CustomTextRow(
                    questionTxt: 'alreadyHaveAnAccount'.tr(),
                    clickTxt: 'loginLabel'.tr(),
                    onTap: () {
                      //go back to login page
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
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
