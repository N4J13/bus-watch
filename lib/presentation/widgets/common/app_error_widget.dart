import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  const AppErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error-icon.png',
              width: 120,
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                "Can't find the route you are looking for. Please try again with different search criteria.",
                textAlign: TextAlign.center,
                style: Theme.of(context).primaryTextTheme.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
