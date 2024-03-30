import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/constants/constants.dart';
import 'package:bus_proj/presentation/screens/routes_screen.dart';
import 'package:bus_proj/presentation/widgets/common/app_custom_route.dart';
import 'package:bus_proj/presentation/widgets/common/app_search_field.dart';
import 'common/common.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteSearchWidget extends StatelessWidget {
  final BusBloc bloc;
  const RouteSearchWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: bloc.formKey,
      child: Column(
        children: [
          Container(
            width: screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Find Routes',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppSearchField(
                    bloc: bloc,
                    prefixIcon: PhosphorIcon(
                      duotoneSecondaryColor:
                          Theme.of(context).colorScheme.primary,
                      PhosphorIconsDuotone.navigationArrow,
                    ),
                    controller: bloc.departureController,
                    hintText: "Search Departure",
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                          errorText: 'Departure is required',
                        ),
                        (value) {
                          if (stations.contains(value)) {
                            return null;
                          }
                          return "Station not found";
                        },
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(),
                  ),
                  AppSearchField(
                    bloc: bloc,
                    controller: bloc.destinationController,
                    prefixIcon: PhosphorIcon(
                      duotoneSecondaryColor:
                          Theme.of(context).colorScheme.primary,
                      PhosphorIconsDuotone.mapPinLine,
                    ),
                    hintText: "Search Destination",
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                          errorText: 'Destination is required',
                        ),
                        (value) {
                          if (stations.contains(value)) {
                            return null;
                          }
                          return "Station not found";
                        },
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    text: 'Search',
                    onPressed: () {
                      if (!bloc.formKey.currentState!.validate()) return;
                      Navigator.push(
                        context,
                        AppCustomRoute(screen: const RoutesScreen()),
                      );
                      bloc.getRoutes();
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
      ),
    );
  }
}
