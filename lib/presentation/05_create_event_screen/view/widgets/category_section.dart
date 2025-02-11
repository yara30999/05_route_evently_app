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
          itemCount: CategoryItems.values.length,
          itemBuilder: (buildContext, index) {
            return GestureDetector(
              onTap: () async {
                if (activeIndex != index) {
                  Provider.of<CreateEventProvider>(context, listen: false)
                      .onCategorySelection(index);
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
                          index,
                  categoryItem: CategoryItems.values[index],
                ),
              ),
            );
          }),
    );
  }
}
