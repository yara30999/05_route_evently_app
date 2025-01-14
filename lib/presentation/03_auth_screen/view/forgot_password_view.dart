import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as dui;
import '../../resourses/assets_manager.dart';
import 'widgets/custom_text_form_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  String? email;
  final _formKey = GlobalKey<FormState>();

  void resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(context.tr('forgotPasswordLabel')),
      ),
      body: SafeArea(
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
                  PngAssets.forgotPassword,
                  width: double.infinity,
                  height: 340,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 50),
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
                const SizedBox(height: 30),
                //reset password button
                ElevatedButton(
                  onPressed: resetPassword,
                  child: Text(context.tr('resetPassword')),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
