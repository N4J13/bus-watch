import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

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
              'An error occurred',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: screenWidth * 0.8,
              child: Text(
                'Please try again later, or try with a different search term.',
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
