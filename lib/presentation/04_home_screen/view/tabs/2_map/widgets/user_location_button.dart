import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../resourses/assets_manager.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../view_model/map_tab_provider.dart';

class UserLocationButton extends StatelessWidget {
  const UserLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MapTabProvider>(context, listen: false)
            .getCurrentUserLocation();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: ColorsManager.blue, borderRadius: BorderRadius.circular(12)),
        child: SvgPicture.asset(
          SvgAssets.location,
          colorFilter: ColorFilter.mode(
              Theme.of(context).scaffoldBackgroundColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
