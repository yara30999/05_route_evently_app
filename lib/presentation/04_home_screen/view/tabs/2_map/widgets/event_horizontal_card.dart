import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/extentions.dart';
import '../../../../../../app/functions.dart';
import '../../../../../../domain/entities/event_entity.dart';
import '../../../../../resourses/assets_manager.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/styles_manager.dart';
import '../../../../view_model/map_tab_provider.dart';

class EventHorizontalCard extends StatelessWidget {
  final EventEntity item;

  const EventHorizontalCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final pngImage =
        CategoryItems.values.elementAt(item.categoryId).getPngImage(context);
    final locationString =
        'Lat: ${item.lat.floorToDouble()} Lng: ${item.lng.floorToDouble()}';
    return GestureDetector(
      onTap: () {
        Provider.of<MapTabProvider>(context, listen: false)
            .onEventSelection(LatLng(item.lat, item.lng), item.title);
      },
      child: Container(
        width: 300,
        height: 95,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: ColorsManager.blue,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  pngImage,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.style14Bold()
                        .copyWith(color: ColorsManager.blue),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(
                        SvgAssets.map,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(
                          isLightTheme(context)
                              ? ColorsManager.black
                              : ColorsManager.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        locationString,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style14Medium().copyWith(
                          color: isLightTheme(context)
                              ? ColorsManager.black
                              : ColorsManager.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
