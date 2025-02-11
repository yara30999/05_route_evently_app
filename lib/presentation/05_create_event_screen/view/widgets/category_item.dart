import 'package:flutter/material.dart';
import '../../../../domain/entities/category_item.dart';
import 'active_inactive_category_item.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.isActive,
    required this.categoryItemEntity,
  });

  final bool isActive;
  final CategoryItemEntity categoryItemEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstCurve: Curves.linear,
      secondCurve: Curves.linear,
      duration: const Duration(milliseconds: 500),
      firstChild: ActiveCatigoryItem(categoryItemEntity: categoryItemEntity),
      secondChild: InActiveCatigoryItem(categoryItemEntity: categoryItemEntity),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
