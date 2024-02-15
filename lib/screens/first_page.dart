
import 'package:bus_proj/widgets/slide.dart';
import 'package:flutter/material.dart';

class BeginScreen extends StatefulWidget {
  const BeginScreen({super.key});

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
 
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SlideWidget(),
        ),
      ),
    );
  }
}
