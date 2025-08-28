// lib/main.dart
import 'package:demo_app/src/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Set status bar background color to blue
      statusBarIconBrightness: Brightness.light, // Set icons to light (white)
    ));
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
