import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/01_introduction_screen/view_model/theme_provider.dart';
import '../presentation/resourses/routes_manager.dart';
import '../presentation/resourses/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yara Evently App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      initialRoute: Routes.introductionRoute,
      onGenerateRoute: RouteGenerator.getRoute,
      onGenerateInitialRoutes: RouteGenerator.generateInitialRoutes,
    );
  }
}
