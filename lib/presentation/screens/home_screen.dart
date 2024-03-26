import 'package:bus_proj/presentation/widgets/bus_search.dart';
import 'package:bus_proj/presentation/widgets/recent_search.dart';
import 'package:bus_proj/presentation/widgets/route_search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Najib and Nishma's Dream",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child:  Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                RouteSearchWidget(),
                BusSearchWidget(),
                RecentSearchWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
