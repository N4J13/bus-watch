import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  bool isLoading;
  final Widget child;
  LoadingWidget({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? Lottie.asset('assets/animations/Animation - 1711468008001.json',
              width: 150)
          : child,
    );
  }
}
