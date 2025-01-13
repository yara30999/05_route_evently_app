import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app/app_prefs.dart';
import 'presentation/01_introduction_screen/view_model/theme_provider.dart';
import 'presentation/resourses/language_manager.dart';
import 'presentation/resourses/routes_manager.dart';
import 'presentation/resourses/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences sharedprefs = await SharedPreferences.getInstance();
  runApp(
    EasyLocalization(
        supportedLocales: [
          LocalizationUtils.englishLocal,
          LocalizationUtils.arabicLocal
        ],
        path: 'assets/translations',
        fallbackLocale: LocalizationUtils.englishLocal,
        child: ChangeNotifierProvider(
            create: (context) => ThemeProvider(
                  AppPreferencesImpl(sharedprefs),
                )..getTheme(),
            child: MyApp())),
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
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      initialRoute: Routes.introductionRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
