import 'package:flutter/material.dart';
import 'screens/login.dart';
import 'const/colors.dart';
import 'routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: NavigationServices().generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backColor,
        textTheme: const TextTheme(
          displayMedium:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          labelLarge: TextStyle(color: primaryColor),
          labelSmall:
              TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15),
        ),
      ),
      home: LoginPage(),
    );
  }
}
