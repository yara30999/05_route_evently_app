import 'package:flutter/material.dart';
import '../../../../app/extentions.dart';
import 'active_inactive_category_item.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isActive,
    required this.categoryItem,
  });

  final bool isActive;
  final CategoryItems categoryItem;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      duration: const Duration(milliseconds: 500),
      firstChild: ActiveCatigoryItem(categoryItem),
      secondChild: InActiveCatigoryItem(categoryItem),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
