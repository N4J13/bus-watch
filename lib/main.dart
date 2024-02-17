import 'package:bus_proj/screens/home.dart';
import 'package:bus_proj/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 235, 236, 239),
        textTheme: GoogleFonts.urbanistTextTheme(),
      ),
      home: const OnBoardingScreen(),
    );
  }
}
