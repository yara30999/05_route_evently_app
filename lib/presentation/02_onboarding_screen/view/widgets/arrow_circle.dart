import 'package:flutter/material.dart';
import '../../../resourses/colors_manager.dart';

class ArrowCircle extends StatelessWidget {
  final bool isForward;
  const ArrowCircle({
    super.key,
    this.isForward = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorsManager.blue,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: CircleAvatar(
          foregroundColor: ColorsManager.blue,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Icon(
            isForward ? Icons.arrow_forward : Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}
