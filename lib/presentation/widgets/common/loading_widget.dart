import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: Image.asset(
              'assets/animations/bus-loading.gif',
              width: 150,
            ),
          )
        : child;
  }
}
