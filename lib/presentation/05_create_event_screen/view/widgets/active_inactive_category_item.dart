import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/extentions.dart';
import '../../../../app/functions.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/styles_manager.dart';

class ActiveCatigoryItem extends StatelessWidget {
  const ActiveCatigoryItem(
    this.categoryItem, {
    super.key,
  });
  final CategoryItems categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorsManager.blue,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: ColorsManager.blue),
        boxShadow: [
          BoxShadow(
              color: isLightTheme(context)
                  ? ColorsManager.grey.withValues(alpha: 0.5)
                  : ColorsManager.blue.withValues(alpha: 0.4), // Shadow color
              blurRadius: 1.0, // Spread of the shadow
              offset: Offset(2.0, 4.0), // Shadow position (x, y)
              blurStyle: BlurStyle.normal),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
              aspectRatio: 1,
              child:
                  Center(child: SvgPicture.asset(categoryItem.getSvgIcon()))),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(categoryItem.getName(),
                textAlign: TextAlign.center,
                style: Styles.style16Bold().copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor)),
          ),
        ],
      ),
    );
  }
}

class InActiveCatigoryItem extends StatelessWidget {
  const InActiveCatigoryItem(
    this.categoryItem, {
    super.key,
  });
  final CategoryItems categoryItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: ColorsManager.blue),
        boxShadow: [
          BoxShadow(
              color: isLightTheme(context)
                  ? ColorsManager.grey.withValues(alpha: 0.5)
                  : ColorsManager.blue.withValues(alpha: 0.4), // Shadow color
              blurRadius: 1.0, // Spread of the shadow
              offset: Offset(2.0, 4.0), // Shadow position (x, y)
              blurStyle: BlurStyle.normal),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Center(
              child: SvgPicture.asset(categoryItem.getSvgIcon(),
                  colorFilter:
                      ColorFilter.mode(ColorsManager.blue, BlendMode.srcIn)),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(categoryItem.getName(),
                textAlign: TextAlign.center,
                style:
                    Styles.style16Bold().copyWith(color: ColorsManager.blue)),
          ),
        ],
      ),
    );
  }
}
