import 'package:bus_proj/bloc/bloc.dart';
import 'package:bus_proj/presentation/presentation.dart';
import 'package:bus_proj/presentation/screens/bus_screen.dart';
import 'package:bus_proj/utils/app_input_formatters.dart';
import 'package:bus_proj/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class BusSearchWidget extends StatelessWidget {
  final BusBloc bloc;
  const BusSearchWidget({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: bloc.vehicleFormKey,
                  child: AppTextField(
                    controller: bloc.vehicleController,
                    inputFormatters: [KeralaVehicleNumberFormatter()],
                    hintText: "KL 01 1234",
                    prefixIcon: PhosphorIcon(
                      PhosphorIconsDuotone.bus,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: IconButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    const Size(68, 68),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                onPressed: () {
                  onButtonPressed(context);
                },
                icon: PhosphorIcon(
                  PhosphorIcons.magnifyingGlass(),
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void onButtonPressed(BuildContext context) {
    if (bloc.vehicleController.text.isEmpty) {
      context.showSnackBar(message: "Vehicle Number is required");
      return;
    }

    if (!RegExp(r'^[A-Z]{0,2}\d{0,2}[A-Z]{0,3}\d{0,4}$')
        .hasMatch(bloc.vehicleController.text)) {
      context.showSnackBar(message: "Invalid Vehicle Number");
      return;
    }

    bloc.getRoutesfromVehicle();
    Navigator.push(
      context,
      AppCustomRoute(screen: const BusScreen()),
    );
  }
}


