import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../app/di.dart';
import '../../../app/extentions.dart';
import '../../../app/functions.dart';
import '../../../domain/entities/event_entity.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/language_manager.dart';
import '../view_model/create_edit_event_provider.dart';
import 'widgets/category_section.dart';
import 'widgets/choose_location_button.dart';
import 'widgets/event_text_field.dart';
import 'widgets/picker_row.dart';

class CreateEditEventView extends StatefulWidget {
  final EventEntity? eventEntity;
  const CreateEditEventView({super.key, this.eventEntity});

  @override
  State<CreateEditEventView> createState() => _CreateEditEventViewState();
}

class _CreateEditEventViewState extends State<CreateEditEventView> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final bool isCreateEvent;

  @override
  void initState() {
    super.initState();
    isCreateEvent = widget.eventEntity == null ? true : false;
    titleController = TextEditingController(text: widget.eventEntity?.title);
    descriptionController =
        TextEditingController(text: widget.eventEntity?.description);
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int? categoryId = widget.eventEntity?.categoryId;
    CategoryItems? categoryItem = CategoryItems.values[categoryId ?? 1];
    LatLng? location = widget.eventEntity == null
        ? null
        : LatLng(widget.eventEntity!.lat, widget.eventEntity!.lng);
    return ChangeNotifierProvider(
        create: (context) => CreateEditEventProvider(
              instance(),
              instance(),
              categoryIndex: categoryId,
              categoryItem: categoryItem,
              formattedDate: widget.eventEntity?.date,
              formattedTime: widget.eventEntity?.time,
              selectedLocation: location,
            ),
        builder: (context, child) {
          final createEditEventProvider =
              Provider.of<CreateEditEventProvider>(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(
                isCreateEvent ? "create_event".tr() : "edit_event".tr(),
              ),
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
                            .watch<CreateEditEventProvider>()
                            .categoryItem!
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
                          onPressed: createEditEventProvider.isLoading
                              ? null // Disable the button when loading
                              : () {
                                  if (titleController.text.isEmpty ||
                                      descriptionController.text.isEmpty) {
                                    return;
                                  }

                                  Future<void> action = isCreateEvent
                                      ? createEditEventProvider.addEvent(
                                          titleController.text,
                                          descriptionController.text)
                                      : createEditEventProvider.updateEvent(
                                          widget.eventEntity!.id,
                                          titleController.text,
                                          descriptionController.text);

                                  action.then((_) {
                                    if (!createEditEventProvider.isLoading &&
                                        context.mounted &&
                                        createEditEventProvider.errorMessage ==
                                            null) {
                                      showSnakBar(
                                          context,
                                          isCreateEvent
                                              ? 'event_added'.tr()
                                              : 'event_updated'.tr());
                                      Navigator.pop(context);
                                      if (!isCreateEvent) {
                                        // Extra pop only for updates
                                        Navigator.pop(context);
                                      }
                                    } else if (context.mounted) {
                                      showSnakBar(
                                          context,
                                          createEditEventProvider
                                              .errorMessage!);
                                    }
                                  });
                                },
                          child: createEditEventProvider.isLoading
                              ? CircularProgressIndicator()
                              : Text(
                                  isCreateEvent
                                      ? 'add_event'.tr()
                                      : 'update_event'.tr(),
                                ),
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
