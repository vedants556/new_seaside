// lib/app.dart

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

class CoastalTourismApp extends StatelessWidget {
  const CoastalTourismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coastal Tourism App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          secondary: Colors.lightBlueAccent,
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
