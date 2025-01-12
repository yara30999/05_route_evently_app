import 'package:flutter/material.dart';
import 'presentation/resourses/routes_manager.dart';
import 'presentation/resourses/theme_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yara Evently App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      initialRoute: Routes.introductionRoute,
      onGenerateRoute: RouteGenerator.getRoute,
    );
  }
}
