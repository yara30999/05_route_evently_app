import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../app/extentions.dart';

class CreateEventProvider extends ChangeNotifier {
  CategoryItems categoryItem = CategoryItems.values.first;
  int categoryIndex = 0;
  String? formattedDate;
  String? formattedTime;

  void onCategorySelection(int index) {
    categoryItem = CategoryItems.values[index];
    categoryIndex = index;
    notifyListeners();
  }

  void changeSelectedDate(DateTime date) {
    formattedDate = DateFormat('dd/MM/yyyy').format(date);
    notifyListeners();
  }

  void changeSelectedTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    formattedTime = DateFormat('hh:mm a').format(dt);
    notifyListeners();
  }
}
