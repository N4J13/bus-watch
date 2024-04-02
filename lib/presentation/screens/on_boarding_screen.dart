import 'package:bus_proj/presentation/widgets/slide_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Theme.of(context).colorScheme.primary,
              const Color.fromARGB(255, 140, 114, 243),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Spacer(),
              Text(
                "Know Your Bus Timings",
                textAlign: TextAlign.left,
                style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "This is a bus project that helps you to find the best route for your destination.",
                textAlign: TextAlign.start,
                style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 50),
              const SlideButtonWidget(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
