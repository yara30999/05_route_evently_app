import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/functions.dart';
import '../../../../../03_auth_screen/view_model/auth_provider.dart';
import '../../../../../resourses/assets_manager.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/routes_manager.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
              backgroundColor: WidgetStatePropertyAll(ColorsManager.softRed)),
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
              ? Row(
                  spacing: 5,
                  children: [
                    SizedBox(width: 16),
                    SvgPicture.asset(SvgAssets.logout),
                    Text(context.tr('logout_account')),
                    SizedBox(width: 16),
                    CircularProgressIndicator(color: ColorsManager.peach)
                  ],
                )
              : Row(
                  spacing: 5,
                  children: [
                    SizedBox(width: 16),
                    SvgPicture.asset(SvgAssets.logout),
                    Text(context.tr('logout_account')),
                  ],
                )),
    );
  }
}
