import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/functions.dart';
import '../../../resourses/colors_manager.dart';
import '../../../resourses/styles_manager.dart';

class EventTextField extends StatelessWidget {
  final String label;
  final String hint;
  final int? maxLines;
  final String? svgString;
  const EventTextField({
    super.key,
    required this.textController,
    required this.label,
    required this.hint,
    this.maxLines,
    this.svgString,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Styles.style16Medium(),
        ),
        TextField(
          controller: textController,
          maxLines: maxLines,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: svgString == null
                ? null
                : IconButton(
                    onPressed: null,
                    icon: SvgPicture.asset(
                      svgString!,
                      colorFilter: ColorFilter.mode(
                          isLightTheme(context)
                              ? ColorsManager.grey
                              : ColorsManager.white,
                          BlendMode.srcIn),
                    )),
            //default border
            border: isLightTheme(context)
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16)))
                : null,
            // enabled border style
            enabledBorder: isLightTheme(context)
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16)))
                : null,
            // focused border style
            focusedBorder: isLightTheme(context)
                ? const OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsManager.grey, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(16)))
                : null,
          ),
        )
      ],
    );
  }
}
