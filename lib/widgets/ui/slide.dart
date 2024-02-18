import 'package:bus_proj/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      elevation: 0,
      outerColor: Colors.white,
      innerColor: Colors.deepPurple,
      sliderButtonIcon: PhosphorIcon(
        PhosphorIcons.bus(),
        color: Colors.white,
      ),
      onSubmit: () async{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    );
  }
}
