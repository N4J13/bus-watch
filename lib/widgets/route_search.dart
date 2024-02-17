import 'package:bus_proj/widgets/ui/app_text_field.dart';
import 'package:bus_proj/widgets/ui/button.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteSearchWidget extends StatelessWidget {
  const RouteSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController originController = TextEditingController();
    TextEditingController destinationController = TextEditingController();
    final validate = ValidationBuilder().minLength(10).maxLength(50).build();
    return Column(
      children: [
        Container(
          height: 300,
          width: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 235, 236, 239),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      'Find Routes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                AppTextField(
                  controller: originController,
                  hintText: 'Search Origin',
                  prefixIcon: PhosphorIcon(
                    PhosphorIcons.magnifyingGlass(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid value';
                    } else {
                      return null;
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Divider(color: Colors.black),
                ),
                // const SizedBox(height: 20),
                AppTextField(
                  controller: destinationController,
                  hintText: 'Search Destination',
                  prefixIcon: PhosphorIcon(
                    PhosphorIcons.magnifyingGlass(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid value';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Button(
                  text: 'Search',
                  onPressed: () {
                    print('button');
                  },
                  icon: PhosphorIcon(
                    PhosphorIcons.magnifyingGlass(),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
