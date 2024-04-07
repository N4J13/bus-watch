import 'package:bus_proj/bloc/bloc.dart';
import 'package:bus_proj/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteSearchAppBar extends StatelessWidget {
  final BusBloc bloc;
  final bool isVehicleSearch;
  const RouteSearchAppBar({
    super.key,
    required this.bloc,
    this.isVehicleSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<BusBloc, BusState>(
      listener: (context, state) {
        if (state is BusTimeSelected) {
          context.showSnackBar(message: "Showing Buses from ${state.time}");
          bloc.getRoutes();
        }
      },
      child: SliverAppBar(
        expandedHeight: 170,
        collapsedHeight: 70,
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            padding: const EdgeInsets.only(top: 25),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Center(
                child: isVehicleSearch
                    ? Text(
                        bloc.vehicleController.text,
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleMedium!
                            .copyWith(
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.3,
                            child: Text(
                              bloc.departure.createShortName(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium!
                                  .copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                              bloc.destination.createShortName(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium!
                                  .copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                            ),
                          ),
                        ],
                      )),
          ),
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        actions: [
          !isVehicleSearch
              ? IconButton(
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
                )
              : const SizedBox(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
