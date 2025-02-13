import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../resourses/assets_manager.dart';
import '../../../../../resourses/colors_manager.dart';
import '../../../../../resourses/styles_manager.dart';
import '../../../../view_model/love_tab_provider.dart';

class FavouritesSearchField extends StatefulWidget {
  const FavouritesSearchField({
    super.key,
  });

  @override
  State<FavouritesSearchField> createState() => _FavouritesSearchFieldState();
}

class _FavouritesSearchFieldState extends State<FavouritesSearchField> {
  final TextEditingController _textEditingController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_onSearchChanged);
    _textEditingController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged() {
    // Cancel the previous debounce timer
    _debounce?.cancel();

    // Start a new debounce timer when user stops typing :)
    _debounce = Timer(const Duration(seconds: 3), () {
      final provider = context.read<LoveTabProvider>();
      provider.setSearchQuery(_textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
      child: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: 'search_for_event'.tr(),
            hintStyle:
                Styles.style16Medium().copyWith(color: ColorsManager.blue),
            prefixIcon: IconButton(
                onPressed: null, icon: SvgPicture.asset(SvgAssets.search))),
      ),
    );
  }
}
