import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'presentation/resourses/language_manager.dart';
import 'presentation/resourses/routes_manager.dart';
import 'presentation/resourses/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [
          LocalizationUtils.englishLocal,
          LocalizationUtils.arabicLocal
        ],
        path: 'assets/translations',
        fallbackLocale: LocalizationUtils.englishLocal,
        child: MyApp()),
  );
}

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
      themeMode: ThemeMode.system,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      initialRoute: Routes.introductionRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
