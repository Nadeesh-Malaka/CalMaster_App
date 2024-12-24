import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CalMaster App',
      initialRoute: '/', // Start with the loading screen
      routes: {
        '/': (context) => const LoadingScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
