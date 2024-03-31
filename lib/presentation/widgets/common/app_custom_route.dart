import 'package:flutter/material.dart';

class AppCustomRoute extends PageRouteBuilder {
  final Widget screen;

  AppCustomRoute({required this.screen})
      : super(
            pageBuilder: (context, animation1, animation2) => screen,
            transitionDuration:
                const Duration(milliseconds: 400), // Adjusted duration
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              final tween = Tween(begin: begin, end: end);
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );

              return SlideTransition(
                position: tween.animate(curvedAnimation),
                child: child,
              );
            });
}
