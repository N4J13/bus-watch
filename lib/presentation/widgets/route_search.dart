import 'package:bus_proj/bloc/bus_bloc.dart';
import 'common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteSearchWidget extends StatelessWidget {
  const RouteSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BusBloc busBloc = context.read<BusBloc>();
    final double screenWidth = MediaQuery.of(context).size.width;
    return Form(
      key: busBloc.formKey,
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
                  AppTextField(
                    controller: busBloc.originController,
                    hintText: 'Search Origin',
                    prefixIcon: PhosphorIcon(
                      PhosphorIcons.navigationArrow(),
                    ),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                          errorText: 'Origin is required',
                        ),
                      ],
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Divider(),
                  ),
                  // const SizedBox(height: 20),
                  AppTextField(
                    controller: busBloc.destinationController,
                    hintText: 'Search Destination',
                    prefixIcon: PhosphorIcon(
                      PhosphorIcons.mapPinLine(),
                    ),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                          errorText: 'Destination is required',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  Button(
                    text: 'Search',
                    onPressed: () {
                      busBloc.getRoutes();
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
