import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../app/di.dart';
import '../../../app/extentions.dart';
import '../../../app/functions.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/language_manager.dart';
import '../view_model/create_event_provider.dart';
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
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CreateEventProvider(instance()),
        builder: (context, child) {
          final createEventProvider = Provider.of<CreateEventProvider>(context);
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
                        context
                            .watch<CreateEventProvider>()
                            .categoryItem
                            .getPngImage(context),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 16,
                        right: LocalizationUtils.isCurrentLocalAr(context)
                            ? 16
                            : 0.0,
                        left: LocalizationUtils.isCurrentLocalAr(context)
                            ? 0.0
                            : 16),
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
                          textController: descriptionController,
                          maxLines: 5,
                        ),
                        PickerRow(EventPicker.date),
                        PickerRow(EventPicker.time),
                        ChooseLocationButton(),
                        ElevatedButton(
                          onPressed: createEventProvider.isLoading
                              ? null // Disable the button when loading
                              : () {
                                  if (titleController.text.isNotEmpty &&
                                      descriptionController.text.isNotEmpty) {
                                    createEventProvider
                                        .addEvent(titleController.text,
                                            descriptionController.text)
                                        .then((_) {
                                      if (!createEventProvider.isLoading &&
                                          context.mounted &&
                                          createEventProvider.errorMessage ==
                                              null) {
                                        showSnakBar(
                                            context, 'event_added'.tr());
                                        Navigator.pop(context);
                                      } else {
                                        if (context.mounted) {
                                          showSnakBar(
                                              context,
                                              createEventProvider
                                                  .errorMessage!);
                                        }
                                      }
                                    });
                                  }
                                },
                          child: createEventProvider.isLoading
                              ? CircularProgressIndicator()
                              : Text('add_event'.tr()),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
