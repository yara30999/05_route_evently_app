import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../app/extentions.dart';
import '../../../../app/functions.dart';
import '../../../resourses/assets_manager.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/styles_manager.dart';
import '../../view_model/create_event_provider.dart';

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
              if (chosenDate != null && context.mounted) {
                Provider.of<CreateEventProvider>(context, listen: false)
                    .changeSelectedDate(chosenDate);
              }
            } else {
              var chosenTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (chosenTime != null && context.mounted) {
                Provider.of<CreateEventProvider>(context, listen: false)
                    .changeSelectedTime(chosenTime);
              }
            }
          },
          child: Text(
            eventPicker == EventPicker.date
                ? context.watch<CreateEventProvider>().formattedDate ??
                    'choose_date'.tr()
                : context.watch<CreateEventProvider>().formattedTime ??
                    "choose_time".tr(),
            style: Styles.style16Medium().copyWith(color: ColorsManager.blue),
          ),
        ),
      ],
    );
  }
}
