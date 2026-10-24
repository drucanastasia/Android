import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/home_screen.dart';
import 'cubit/medical_cubit.dart';

void main() => runApp(const MedCareApp());

class AppColors {
  static const teal = Color(0xFF149CB0);
  static const dark = Color(0xFF171A22);
  static const grey = Color(0xFF9A9AA3);
  static const lightGrey = Color(0xFFF7F7F9);
  static const iconBg = Color(0xFFE7F3F1);
}

class MedCareApp extends StatelessWidget {
  const MedCareApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: BlocProvider(
        create: (_) => MedicalCubit()..loadData(),
        child: const HomeScreen(),
      ),
    );
  }
}
