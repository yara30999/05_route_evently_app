import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../03_auth_screen/view_model/auth_provider.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/styles_manager.dart';

class UserNameColumn extends StatelessWidget {
  const UserNameColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          SizedBox(),
          Text(
            'welcome'.tr(),
            maxLines: 2,
            style: Styles.style16Medium().copyWith(
              color: ColorsManager.white,
            ),
          ),
          Text(
            Provider.of<AuthProvider>(context).authObj!.name,
            style: Styles.style24Bold().copyWith(
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
