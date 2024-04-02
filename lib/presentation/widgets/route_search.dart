import 'package:bus_proj/bloc/bloc.dart';
import 'package:bus_proj/constants/constants.dart';
import 'package:bus_proj/presentation/screens/routes_screen.dart';
import 'package:bus_proj/presentation/widgets/common/app_search_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'common/common.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteSearchWidget extends StatelessWidget {
  final BusBloc bloc;
  const RouteSearchWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return BlocBuilder<BusBloc, BusState>(
      builder: (context, state) {
        return Form(
          key: bloc.formKey,
          child: Column(
            children: [
              Container(
                width: screenSize.width,
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
                      Stack(
                        children: [
                          Column(
                            children: [
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
                            ],
                          ),
                          Positioned(
                            right: 20,
                            top: 30,
                            child: OutlinedButton(
                              onPressed: () {
                                bloc.swapStations();
                              },
                              child: PhosphorIcon(
                                PhosphorIconsFill.arrowsDownUp,
                                color: Theme.of(context).colorScheme.primary,
                                size: 22,
                              ),
                            ),
                          ),
                        ],
                      ),
                      CheckboxListTile(
                        title: const Text("Include All Routes"),
                        value: bloc.restrict,
                        onChanged: (newValue) {
                          bloc.toggleRestrict(newValue!);
                        },
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      const SizedBox(height: 10),
                      Button(
                        text: 'Search',
                        onPressed: () {
                          if (!bloc.formKey.currentState!.validate()) return;
                          bloc.getRoutes();
                          Navigator.push(
                            context,
                            AppCustomRoute(screen: const RoutesScreen()),
                          );
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
      },
    );
  }
}
