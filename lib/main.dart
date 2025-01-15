import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'app/di.dart';
import 'app/functions.dart';
import 'firebase_options.dart';
import 'presentation/01_introduction_screen/view_model/theme_provider.dart';
import 'presentation/resourses/constants_manager.dart';
import 'presentation/resourses/language_manager.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Hive.initFlutter();
  hiveAdapters();
  await hiveBoxes();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  Future.delayed(Duration(seconds: AppConstants.splashDelay))
      .then((value) => {FlutterNativeSplash.remove()});
  runApp(
    EasyLocalization(
        supportedLocales: [
          LocalizationUtils.englishLocal,
          LocalizationUtils.arabicLocal
        ],
        path: 'assets/translations',
        fallbackLocale: LocalizationUtils.englishLocal,
        child: ChangeNotifierProvider(
            create: (context) => ThemeProvider(instance())..getTheme(),
            child: MyApp())),
  );
}
