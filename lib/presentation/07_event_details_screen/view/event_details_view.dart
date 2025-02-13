import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/extentions.dart';
import '../../../domain/entities/event_entity.dart';
import '../../resourses/assets_manager.dart';
import '../../resourses/colors_manager.dart';
import '../../resourses/routes_manager.dart';
import '../../resourses/styles_manager.dart';
import 'widgets/custom_rounded_button.dart';
import 'widgets/google_maps_with_location.dart';

class EventDetailsView extends StatelessWidget {
  final EventEntity eventEntity;
  const EventDetailsView({super.key, required this.eventEntity});

  @override
  Widget build(BuildContext context) {
    var dateString = eventEntity.date.toLongMonthFormat(context);
    var timeString = eventEntity.time;
    var locationString =
        'Lat: ${eventEntity.lat.floorToDouble()} Lng: ${eventEntity.lng.floorToDouble()}';
    var eventLat = eventEntity.lat;
    var eventLng = eventEntity.lng;
    return Scaffold(
      appBar: AppBar(
        title: Text("event_details".tr()),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.createEditEventRoute,
                    arguments: eventEntity);
              },
              icon: SvgPicture.asset(SvgAssets.edit)),
          IconButton(
              onPressed: () {
                //TODO delete event here ;)
              },
              icon: SvgPicture.asset(SvgAssets.delete)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(25),
                elevation: 6,
                child: Image.asset(
                  CategoryItems.values[eventEntity.categoryId]
                      .getPngImage(context),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                eventEntity.title,
                style:
                    Styles.style24Medium().copyWith(color: ColorsManager.blue),
              ),
              CustomRoundedButton(
                firstLabel: dateString,
                secondLabel: timeString,
              ),
              CustomRoundedButton(
                firstLabel: locationString,
              ),
              GoogleMapWithLocaion(
                lat: eventLat,
                lng: eventLng,
              ),
              Text(
                'description'.tr(),
                style: Styles.style16Medium(),
              ),
              Text(
                eventEntity.description,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
                style: Styles.style16Medium(),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
