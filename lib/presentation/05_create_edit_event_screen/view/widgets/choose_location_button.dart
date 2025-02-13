import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../app/functions.dart';
import '../../../resourses/assets_manager.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/routes_manager.dart';
import '../../../resourses/styles_manager.dart';
import '../../view_model/create_edit_event_provider.dart';

class ChooseLocationButton extends StatelessWidget {
  const ChooseLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<CreateEditEventProvider>();
    var locationLabel = provider.selectedLocation == null
        ? null
        : 'Lat: ${provider.selectedLocation!.latitude.floorToDouble()} Lng: ${provider.selectedLocation!.longitude.floorToDouble()}';
    return OutlinedButton(
        onPressed: () async {
          try {
            await context
                .read<CreateEditEventProvider>()
                .getCurrentUserLocation();
            if (context.mounted) {
              Navigator.pushNamed(context, Routes.pickLocationRoute,
                  arguments: context.read<CreateEditEventProvider>());
            }
          } catch (e) {
            if (context.mounted) {
              showSnakBar(context, e.toString());
            }
          }
        },
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
              locationLabel ?? "choose_location".tr(),
              style: Styles.style16Medium(),
            ),
            Spacer(),
            Icon(Icons.arrow_forward),
          ],
        ));
  }
}
