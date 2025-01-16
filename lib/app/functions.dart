import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../domain/entities/auth_entity.dart';
import '../presentation/resourses/constants_manager.dart';

Future<void> hiveBoxes() async {
  await Hive.openBox<AuthenticationEntity>(AppConstants.kUserDataBox);
}

void hiveAdapters() {
  Hive.registerAdapter(AuthenticationEntityAdapter());
}

void showSnakBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
      ),
    ),
  );
}
