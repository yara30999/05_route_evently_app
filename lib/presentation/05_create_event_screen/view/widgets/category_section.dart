import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/extentions.dart';
import '../../../resourses/language_manager.dart';
import '../../view_model/create_event_provider.dart';
import 'category_item.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    int activeIndex = context.watch<CreateEventProvider>().categoryIndex;
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: CategoryItems.values.length - 1,
          itemBuilder: (buildContext, index) {
            // to start from (birthday = 1) ,(bookClub = 2), ...
            // and remove (all=0)
            var actualIndex = index + 1;
            return GestureDetector(
              onTap: () async {
                if (activeIndex != actualIndex) {
                  Provider.of<CreateEventProvider>(context, listen: false)
                      .onCategorySelection(actualIndex);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right:
                        LocalizationUtils.isCurrentLocalAr(context) ? 0.0 : 10,
                    left:
                        LocalizationUtils.isCurrentLocalAr(context) ? 10 : 0.0),
                child: CategoryItem(
                  isActive:
                      context.watch<CreateEventProvider>().categoryIndex ==
                          actualIndex,
                  categoryItem: CategoryItems.values[actualIndex],
                ),
              ),
            );
          }),
    );
  }
}
