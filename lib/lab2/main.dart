import 'package:flutter/material.dart';
import '../lab3/screens/home_screen.dart';

void main() {
  runApp(const MedCareApp());
}

class AppColors {
  static const teal = Color(0xFF129CB1);
  static const dark = Color(0xFF111827);
  static const grey = Color(0xFF9CA3AF);
  static const lightGrey = Color(0xFFF5F5F6);
  static const iconBg = Color(0xFFE7F4F2);
}

class MedCareApp extends StatelessWidget {
  const MedCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedCare',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
