

import 'package:bus_proj/constants/color.dart';
import 'package:bus_proj/widgets/bus_search.dart';
import 'package:bus_proj/widgets/recent_search.dart';
import 'package:bus_proj/widgets/route_search.dart';
import 'package:bus_proj/widgets/ui/button.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Najib and Nishma's Bus App",
          style: TextStyle(color: MyColors.primary),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Button(
                    text: "Find Routes",
                    variant: ButtonVariant.primary,
                    onPressed: () => {},
                    icon: PhosphorIcon(
                      PhosphorIcons.bus(),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Button(
                    text: "Find Bus Stops",
                    onPressed: () {
                      print("Button pressed");
                    },
                    icon: PhosphorIcon(
                      PhosphorIcons.mapPin(),
                      color: Colors.black87,
                    ),
                    variant: ButtonVariant.secondary,
                  ),
                ),
              ],
            ),

            Button(text: "Find Routes", onPressed: () => print("Find Routes")),

            const RouteSearchWidget(),
            const BusSearchWidget(),
            const RecentSearchWidget(),
          ],
        ),
      )),
    );
  }
}
