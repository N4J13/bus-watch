import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello World! 👋🏻',
            style: Theme.of(context).primaryTextTheme.titleLarge,
          ),
          const SizedBox(height: 20),
          Text(
            'This app is created by N Square Solutions. We are a team of developers who are passionate about creating apps that are useful and user-friendly. We developed this app using a opensource api built by Amith. If you have any feedback or suggestions, please feel free to reach out to us at. Thank you for using our app! 🚀',
            style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                  height: 1.75,
                ),
          ),
        ],
      ),
    );
  }
}
