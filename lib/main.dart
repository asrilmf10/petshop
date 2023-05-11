import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'access_service.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<accessServices>(
          create: (_) => accessServices(),
        ),
        ChangeNotifierProvider<DarkMode>(
          create: (_) => DarkMode(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var mainTheme = ThemeData.light();
  var darkTheme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<DarkMode>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode.darkMode ? mainTheme : darkTheme,
      home: const splashScreen(),
    );
  }
}

class DarkMode with ChangeNotifier {
  bool darkMode = true;

  changeMode() {
    darkMode = !darkMode;
    notifyListeners();
  }
}
