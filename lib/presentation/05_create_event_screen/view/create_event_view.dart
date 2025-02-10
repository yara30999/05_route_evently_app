import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../resourses/assets_manager.dart';

class CreateEventView extends StatelessWidget {
  const CreateEventView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("create_event".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                PngAssets.birthday,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
