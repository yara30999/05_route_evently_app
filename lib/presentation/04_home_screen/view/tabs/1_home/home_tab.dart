import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/home_tab_provider.dart';
import '../../widgets/events_stream_builder.dart';
import 'widgets/home_header.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeTabProvider(),
      builder: (context, child) {
        return Column(
          children: [
            HomeHeader(),
            Expanded(
              child: EventsStreamBuilder(),
            ),
          ],
        );
      },
    );
  }
}
