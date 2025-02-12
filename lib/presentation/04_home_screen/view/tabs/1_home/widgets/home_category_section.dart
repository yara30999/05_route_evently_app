import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../app/extentions.dart';
import '../../../../../resourses/language_manager.dart';
import '../../../../view_model/home_tab_provider.dart';
import 'home_category_item.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    int activeIndex = context.watch<HomeTabProvider>().categoryIndex;
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: CategoryItems.values.length,
          itemBuilder: (buildContext, index) {
            //var newIndex = index - 1;
            return GestureDetector(
              onTap: () async {
                if (activeIndex != index) {
                  Provider.of<HomeTabProvider>(context, listen: false)
                      .onCategorySelection(index);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right:
                        LocalizationUtils.isCurrentLocalAr(context) ? 0.0 : 10,
                    left:
                        LocalizationUtils.isCurrentLocalAr(context) ? 10 : 0.0),
                child: HomeCategoryItem(
                  isActive:
                      context.watch<HomeTabProvider>().categoryIndex == index,
                  categoryItem: CategoryItems.values[index],
                ),
              ),
            );
          }),
    );
  }
}
