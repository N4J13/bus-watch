import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/presentation/screens/on_boarding_screen.dart';
import 'package:bus_proj/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => BusBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en'),
      ],
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home:
          const OnBoardingScreen(), // Change this to HomeScreen() if user is already onboarded
    );
  }
}
