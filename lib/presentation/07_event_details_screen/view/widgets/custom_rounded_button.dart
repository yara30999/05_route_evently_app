import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/functions.dart';
import '../../../resourses/assets_manager.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/styles_manager.dart';

class CustomRoundedButton extends StatelessWidget {
  final String firstLabel;
  final String? secondLabel;
  const CustomRoundedButton({
    super.key,
    required this.firstLabel,
    this.secondLabel,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: null,
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
                secondLabel == null ? SvgAssets.location : SvgAssets.date,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).scaffoldBackgroundColor, BlendMode.srcIn),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  firstLabel,
                  style: Styles.style16Medium()
                      .copyWith(color: ColorsManager.blue),
                ),
                if (secondLabel != null)
                  Text(
                    secondLabel ?? '',
                    style: Styles.style16Medium().copyWith(
                        color: isLightTheme(context)
                            ? ColorsManager.black
                            : ColorsManager.white),
                  ),
              ],
            ),
            if (secondLabel == null) Spacer(),
            if (secondLabel == null) Icon(Icons.arrow_forward),
          ],
        ));
  }
}
