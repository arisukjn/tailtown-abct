import 'package:flutter/material.dart';
import 'screens/get_started_screen.dart';

void main() {
  runApp(const TailTownApp());
}

class TailTownApp extends StatelessWidget {
  const TailTownApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TailTown',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A90B8),
        ),
        useMaterial3: true,
        fontFamily: 'Nunito',
      ),
      home: const GetStartedScreen(),
    );
  }
}