import 'package:bus_proj/bloc/bloc.dart';
import 'package:bus_proj/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteSearchAppBar extends StatelessWidget {
  final BusBloc bloc;
  const RouteSearchAppBar({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<BusBloc, BusState>(
      listener: (context, state) {
        if (state is BusTimeSelected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              content: Text(
                'Showing Buses from ${state.time}',
              ),
            ),
          );
          bloc.getRoutes();
        }
      },
      child: SliverAppBar(
        expandedHeight: 170,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(top: 25),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.3,
                child: Text(
                  bloc.departureController.text.createShortName(),
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).primaryTextTheme.titleMedium!.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              PhosphorIcon(
                PhosphorIconsRegular.arrowRight,
                color: Theme.of(context).colorScheme.onPrimary,
                size: 18,
              ),
              const SizedBox(
                width: 50,
              ),
              SizedBox(
                width: screenWidth * 0.3,
                child: Text(
                  bloc.destinationController.text.createShortName(),
                  textAlign: TextAlign.center,
                  style:
                      Theme.of(context).primaryTextTheme.titleMedium!.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                ),
              ),
            ],
          )),
        ),
        leading: IconButton(
          icon: PhosphorIcon(
            PhosphorIconsRegular.arrowLeft,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 24,
          ),
          style: Theme.of(context).iconButtonTheme.style!.copyWith(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent),
              ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: PhosphorIcon(
              PhosphorIconsRegular.clockAfternoon,
              size: 24,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () async {
              final TimeOfDay? selectedTime = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );
              bloc.getTime(selectedTime as TimeOfDay);
            },
            style: Theme.of(context).iconButtonTheme.style!.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(
                    Colors.black12,
                  ),
                ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
