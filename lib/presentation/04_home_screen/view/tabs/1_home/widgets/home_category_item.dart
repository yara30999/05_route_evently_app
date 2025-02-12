import 'package:flutter/material.dart';

import '../../../../../../app/extentions.dart';
import 'active_inactive_home_category_items.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({
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
      firstChild: ActiveHomeCatigoryItem(categoryItem),
      secondChild: InActiveHomeCatigoryItem(categoryItem),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
