import 'package:bus_proj/presentation/screens/home_screen.dart';
import 'package:bus_proj/presentation/widgets/common/app_custom_route.dart';
import 'package:bus_proj/services/services.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideButtonWidget extends StatelessWidget {
  const SlideButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    StorageService sharedPrefs = StorageService();
    return SlideAction(
      elevation: 0,
      outerColor: Theme.of(context).colorScheme.onPrimary,
      innerColor: Theme.of(context).colorScheme.primary,
      animationDuration: const Duration(milliseconds: 100),
      sliderButtonIcon: PhosphorIcon(
        PhosphorIcons.bus(),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      onSubmit: () async {
        sharedPrefs.saveBool('isOnBoard', true);
        Navigator.pushReplacement(
          context,
          AppCustomRoute(screen: const HomeScreen())
        );
      },
    );
  }
}
