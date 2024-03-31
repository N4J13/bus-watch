import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/presentation/presentation.dart';
import 'package:bus_proj/services/services.dart';
import 'package:bus_proj/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HiveService hiveService = HiveService();
  hiveService.init();

  StorageService sharedPrefs = StorageService();
  bool isOnBoard = await sharedPrefs.getBool('isOnBoard');

  FlutterNativeSplash.remove();
  runApp(BlocProvider(
    create: (context) => BusBloc(),
    child: MyApp(isOnBoard: isOnBoard),
  ));
}

class MyApp extends StatelessWidget {
  final bool isOnBoard;
  const MyApp({super.key, required this.isOnBoard});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en'),
      ],
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: isOnBoard ? const HomeScreen() : const OnBoardingScreen(),
    );
  }
}
