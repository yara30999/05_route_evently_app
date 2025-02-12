import 'package:flutter/material.dart';
import '../../../app/extentions.dart';

class HomeTabProvider extends ChangeNotifier {
  HomeTabProvider();

  int categoryIndex = 0;
  CategoryItems categoryItem = CategoryItems.values.first;

  void onCategorySelection(int index) {
    categoryIndex = index;
    notifyListeners();
  }
}
