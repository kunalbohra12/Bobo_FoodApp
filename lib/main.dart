// lib/main.dart
import 'package:demo_app/src/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      title: 'Custom Flutter App',
      debugShowCheckedModeBanner: false,
      home: const Onboardingscreen(), // Show Splash first
      
    );
  }
}
