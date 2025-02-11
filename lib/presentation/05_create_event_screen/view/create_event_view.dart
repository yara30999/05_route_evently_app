import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../app/extentions.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/language_manager.dart';
import 'widgets/category_section.dart';
import 'widgets/choose_location_button.dart';
import 'widgets/event_text_field.dart';
import 'widgets/picker_row.dart';

class CreateEventView extends StatefulWidget {
  const CreateEventView({super.key});

  @override
  State<CreateEventView> createState() => _CreateEventViewState();
}

class _CreateEventViewState extends State<CreateEventView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController decriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("create_event".tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(25),
                elevation: 6,
                child: Image.asset(
                  PngAssets.birthday,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 16,
                  right: LocalizationUtils.isCurrentLocalAr(context) ? 16 : 0.0,
                  left: LocalizationUtils.isCurrentLocalAr(context) ? 0.0 : 16),
              child: const CategorySection(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 16,
                children: [
                  EventTextField(
                    label: 'title'.tr(),
                    hint: 'event_title'.tr(),
                    textController: titleController,
                    svgString: SvgAssets.eventTitle,
                  ),
                  EventTextField(
                    label: 'description'.tr(),
                    hint: 'event_description'.tr(),
                    textController: decriptionController,
                    maxLines: 5,
                  ),
                  PickerRow(EventPicker.date),
                  PickerRow(EventPicker.time),
                  ChooseLocationButton(),
                  ElevatedButton(
                      onPressed: () {}, child: Text('add_event'.tr()))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
