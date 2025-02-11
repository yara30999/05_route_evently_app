import 'package:flutter/material.dart';
import '../../../../domain/entities/category_item.dart';
import '../../../resourses/language_manager.dart';
import 'category_item.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int activeIndex = 0;

  void _onCategorySelection(int index) {
    if (activeIndex != index) {
      // //save the category index to the bloc
      // BlocProvider.of<NoBreedBloc>(context).add(CategoryEvent(index));
      setState(() {
        activeIndex = index;
      });
      // var uid = context.read<AuthCubit>().authObj!.uid;
      // //trigger the request here
      // BlocProvider.of<NoBreedBloc>(context)
      //     .add(CategoryImagesEvent(uid: uid, pageNum: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: CategoryItemEntity.items.length,
          itemBuilder: (buildContext, index) {
            return GestureDetector(
              onTap: () async {
                if (activeIndex != index) {
                  _onCategorySelection(index);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                    right:
                        LocalizationUtils.isCurrentLocalAr(context) ? 0.0 : 10,
                    left:
                        LocalizationUtils.isCurrentLocalAr(context) ? 10 : 0.0),
                child: CategoryItem(
                  isActive: activeIndex == index,
                  categoryItemEntity: CategoryItemEntity.items[index],
                ),
              ),
            );
          }),
    );
  }
}
