import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors_manager.dart';
import 'styles_manager.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorsManager.white,
    primaryColor: ColorsManager.blue,
    hintColor: ColorsManager.white,
    focusColor: ColorsManager.grey,

    //app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      centerTitle: true,
      titleTextStyle: Styles.style20Medium().copyWith(
        color: ColorsManager.blue,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.blue,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    // divider theme
    dividerTheme: const DividerThemeData(
      color: ColorsManager.blue,
      thickness: 1,
    ),

    // text selection theme
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.blue,
      selectionColor: ColorsManager.blue..withValues(alpha: 0.5),
      // Change the handle to blue for the text form field ;)
      selectionHandleColor: ColorsManager.blue,
    ),

    // text form field theme
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(16),
      hintStyle: Styles.style16Medium(),
      errorStyle: Styles.style10Regular().copyWith(color: ColorsManager.red),
      labelStyle: Styles.style16Medium(),
      //default border
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // error border style
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
    ),

    // floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 24,
      foregroundColor: ColorsManager.offwhite,
      backgroundColor: ColorsManager.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: Colors.white, width: 4),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: ColorsManager.blue, width: 2),
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 12),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.blue,
        textStyle: Styles.style20Medium(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    // outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(Styles.style16Medium()),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        iconColor: WidgetStatePropertyAll(ColorsManager.blue),
        foregroundColor: WidgetStatePropertyAll(ColorsManager.blue),
        backgroundColor: WidgetStatePropertyAll(ColorsManager.white),
        side: WidgetStatePropertyAll(BorderSide(color: ColorsManager.blue)),
      ),
    ),

    // bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.blue,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white,
    ),

    // text button theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(ColorsManager.blue),
        textStyle: WidgetStateProperty.all<TextStyle>(
          Styles.style16Bold().copyWith(
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              color: ColorsManager.blue),
        ),
      ),
    ),

    //snak bar theme
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: ColorsManager.peachDark,
      contentTextStyle: Styles.style16Medium(),
    ),

    //progress indicator theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorsManager.blue,
      refreshBackgroundColor: ColorsManager.blue,
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorsManager.darkBlue,
    primaryColor: ColorsManager.darkBlue,
    hintColor: ColorsManager.darkBlue,
    focusColor: ColorsManager.blue,

    //app bar theme
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.darkBlue,
      centerTitle: true,
      titleTextStyle: Styles.style20Medium().copyWith(
        color: ColorsManager.blue,
      ),
      iconTheme: IconThemeData(
        color: ColorsManager.blue,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),

    // divider theme
    dividerTheme: const DividerThemeData(
      color: ColorsManager.blue,
      thickness: 1,
    ),

    // text selection theme
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorsManager.blue,
      selectionColor: ColorsManager.blue.withValues(alpha: 0.5),
      // Change the handle to blue for the text form field ;)
      selectionHandleColor: ColorsManager.blue,
    ),

    // text form field theme
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(16),
      hintStyle: Styles.style16Medium(),
      errorStyle: Styles.style10Regular().copyWith(color: ColorsManager.red),
      labelStyle: Styles.style16Medium(),
      //default border
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // enabled border style
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // focused border style
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.blue, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // error border style
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      // focused border style
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsManager.red, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(16))),
    ),

    // floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 24,
      foregroundColor: ColorsManager.offwhite,
      backgroundColor: ColorsManager.darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
        side: BorderSide(color: Colors.white, width: 4),
      ),
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        //side: const BorderSide(color: ColorsManager.blue, width: 2),
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 12),
        foregroundColor: ColorsManager.white,
        backgroundColor: ColorsManager.blue,
        textStyle: Styles.style20Medium(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    // outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(Styles.style16Medium()),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        iconColor: WidgetStatePropertyAll(ColorsManager.blue),
        foregroundColor: WidgetStatePropertyAll(ColorsManager.blue),
        backgroundColor: WidgetStatePropertyAll(ColorsManager.darkBlue),
        side: WidgetStatePropertyAll(BorderSide(color: ColorsManager.blue)),
      ),
    ),

    // bottom navigation bar
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkBlue,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.white,
    ),

    // text button theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(ColorsManager.blue),
        textStyle: WidgetStateProperty.all<TextStyle>(
          Styles.style16Bold().copyWith(
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              color: ColorsManager.blue),
        ),
      ),
    ),

    //snak bar theme
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: ColorsManager.grey,
      contentTextStyle: Styles.style16Medium(),
    ),

    //progress indicator theme
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorsManager.white,
      refreshBackgroundColor: ColorsManager.white,
    ),
  );
}
