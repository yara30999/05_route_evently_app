import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../resourses/assets_manager.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/styles_manager.dart';

class ChooseLocationButton extends StatelessWidget {
  const ChooseLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () {},
        child: Row(
          spacing: 10,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: ColorsManager.blue,
                  borderRadius: BorderRadius.circular(12)),
              child: SvgPicture.asset(
                SvgAssets.location,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).scaffoldBackgroundColor, BlendMode.srcIn),
              ),
            ),
            Text(
              "choose_location".tr(),
              style: Styles.style16Medium(),
            ),
            Spacer(),
            Icon(Icons.arrow_forward),
          ],
        ));
  }
}
