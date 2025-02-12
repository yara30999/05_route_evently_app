import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../../../03_auth_screen/view_model/auth_provider.dart';
import '../../../../../resourses/assets_manager.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/language_manager.dart';
import '../../../../../resourses/styles_manager.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: LocalizationUtils.isCurrentLocalAr(context)
              ? Radius.zero
              : Radius.circular(64),
          bottomRight: LocalizationUtils.isCurrentLocalAr(context)
              ? Radius.circular(64)
              : Radius.zero,
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 10,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1000),
                bottomRight: Radius.circular(1000),
                topLeft: LocalizationUtils.isCurrentLocalAr(context)
                    ? Radius.circular(1000)
                    : Radius.circular(10),
                topRight: LocalizationUtils.isCurrentLocalAr(context)
                    ? Radius.circular(10)
                    : Radius.circular(1000),
              ),
              child: Image.asset(
                PngAssets.route,
                height: 124,
                width: 124,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Provider.of<AuthProvider>(context).authObj!.name,
                    style: Styles.style24Bold().copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                  Text(
                    Provider.of<AuthProvider>(context).authObj!.email,
                    maxLines: 2,
                    style: Styles.style16Medium().copyWith(
                      color: ColorsManager.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
