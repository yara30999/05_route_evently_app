import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../app/di.dart';
import '../../../view_model/love_tab_provider.dart';
import 'widgets/favourites_search_field.dart';
import 'widgets/liked_events_stream_builder.dart';

class LoveTab extends StatelessWidget {
  const LoveTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoveTabProvider(instance()),
      builder: (context, child) {
        return SafeArea(
          child: Column(
            children: [
              FavouritesSearchField(),
              Expanded(
                child: LikedEventsStreamBuilder(),
              ),
            ],
          ),
        );
      },
    );
  }
}
