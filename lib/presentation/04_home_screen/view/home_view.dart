import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/functions.dart';
import '../../03_auth_screen/view_model/auth_provider.dart';
import '../../resourses/routes_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'this is home yara  ',
            style: TextStyle(fontSize: 50),
          ),
          ElevatedButton(
            onPressed: authProvider.isLoading
                ? null // Disable the button when loading
                : () {
                    authProvider.logout().then((_) {
                      if (!authProvider.isLoading) {
                        if (authProvider.errorMessage == null) {
                          if (context.mounted) {
                            Navigator.pushReplacementNamed(
                                context, Routes.introductionRoute);
                          }
                        } else {
                          if (context.mounted) {
                            showSnakBar(context, authProvider.errorMessage!);
                          }
                        }
                      }
                    });
                  },
            child: authProvider.isLoading
                ? CircularProgressIndicator()
                : Text(context.tr('logout_account')),
          ),
        ],
      ),
    );
  }
}
