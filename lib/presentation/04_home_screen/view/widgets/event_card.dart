import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app/extentions.dart';
import '../../../../app/functions.dart';
import '../../../../domain/entities/event_entity.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/routes_manager.dart';
import '../../../resourses/styles_manager.dart';
import '../../view_model/like_unlike_provider.dart';

class EventCard extends StatefulWidget {
  final EventEntity item;

  const EventCard({
    super.key,
    required this.item,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late bool liked;
  @override
  void initState() {
    super.initState();
    liked = widget.item.isLiked;
  }

  @override
  void didUpdateWidget(covariant EventCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the place has changed
    if (oldWidget.item != widget.item) {
      //Update the liked state based on the new Event data
      setState(() {
        liked = widget.item.isLiked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pngImage = CategoryItems.values
        .elementAt(widget.item.categoryId)
        .getPngImage(context);
    final togglefavouriteProvider = context.read<LikeUnlikeProvider>();
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Routes.eventDetailsRoute, arguments: widget.item);
      },
      child: Container(
        height: 200,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isLightTheme(context)
                ? ColorsManager.white
                : ColorsManager.blue,
          ),
        ),
        child: Stack(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                pngImage,
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 42,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.item.date.toShortMonthFormat(),
                  textAlign: TextAlign.center,
                  style:
                      Styles.style16Bold().copyWith(color: ColorsManager.blue),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style16Bold().copyWith(
                          color: isLightTheme(context)
                              ? ColorsManager.black
                              : ColorsManager.white,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        (liked) ? Icons.favorite : Icons.favorite_border,
                        color: ColorsManager.blue,
                      ),
                      onPressed: () {
                        // for immediate effect.
                        setState(() {
                          liked = !liked;
                        });
                        togglefavouriteProvider
                            .toggle(eventId: widget.item.id, isliked: liked)
                            .then((_) {
                          if ( //loading has stopped
                              !togglefavouriteProvider.isLoading &&
                                  // and we have error message .
                                  togglefavouriteProvider.errorMessage !=
                                      null &&
                                  //context still in the rendering tree
                                  context.mounted) {
                            showSnakBar(
                                context, togglefavouriteProvider.errorMessage!);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
