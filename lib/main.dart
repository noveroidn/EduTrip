import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const EduTripApp());
  print("sigma");
}

class EduTripApp extends StatelessWidget {
  const EduTripApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduTrip',
      theme: ThemeData(
        primaryColor: const Color(0xFF3B82F6),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF3B82F6),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3B82F6),
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
