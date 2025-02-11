import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/extentions.dart';
import '../../../../app/functions.dart';
import '../../../resourses/assets_manager.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/styles_manager.dart';

class PickerRow extends StatelessWidget {
  final EventPicker eventPicker;
  const PickerRow(
    this.eventPicker, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        SvgPicture.asset(
          eventPicker == EventPicker.date ? SvgAssets.date : SvgAssets.time,
          colorFilter: ColorFilter.mode(
              isLightTheme(context) ? ColorsManager.black : ColorsManager.white,
              BlendMode.srcIn),
        ),
        Text(
          eventPicker == EventPicker.date
              ? "event_date".tr()
              : "event_time".tr(),
          style: Styles.style16Medium(),
        ),
        Spacer(),
        InkWell(
          onTap: () async {
            if (eventPicker == EventPicker.date) {
              var chosenDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(
                    Duration(days: 365),
                  ));
              if (chosenDate != null) {
                //provider.changeSelectedDate(chosenDate);
              }
            } else {
              var chosenTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (chosenTime != null) {
                //provider.changeSelectedTime(chosenDate);
              }
            }
          },
          child: Text(
            eventPicker == EventPicker.date
                ? 'choose_date'.tr()
                : "choose_time".tr(),
            style: Styles.style16Medium().copyWith(color: ColorsManager.blue),
          ),
        ),
      ],
    );
  }
}
