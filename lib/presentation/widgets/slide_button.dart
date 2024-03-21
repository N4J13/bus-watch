import 'package:bus_proj/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideButtonWidget extends StatelessWidget {
  const SlideButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
        elevation: 0,
        outerColor: Theme.of(context).colorScheme.onPrimary,
        innerColor: Theme.of(context).colorScheme.primary,
        sliderButtonIcon: PhosphorIcon(
          PhosphorIcons.bus(),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onSubmit: () async {
          // TODO :  Store the onboarding status in shared preferences as true
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        });
  }
}
