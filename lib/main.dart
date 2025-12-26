import 'package:flutter/material.dart';
import 'package:appceloe/utils/theme.dart';
import 'package:appceloe/screens/splash_screen.dart';
import 'package:appceloe/screens/login_screen.dart';
import 'package:appceloe/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CeLOE LMS',
      theme: CeloeTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
