import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteSearchAppBar extends StatelessWidget {
  final BusBloc bloc;
  const RouteSearchAppBar({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
            Text(
              bloc.departureController.text,
              style: Theme.of(context).primaryTextTheme.titleMedium!.copyWith(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const SizedBox(
              width: 50,
            ),
            PhosphorIcon(
              PhosphorIconsRegular.arrowRight,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 18,
            ),
            const SizedBox(
              width: 50,
            ),
            Text(
              bloc.destinationController.text,
              style: Theme.of(context).primaryTextTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onPrimary,
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
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => const TimePickerDialog(
                      initialTime: TimeOfDay(hour: 1, minute: 5),
                    ));
          },
          style: Theme.of(context).iconButtonTheme.style!.copyWith(
                backgroundColor: const MaterialStatePropertyAll(
                  Colors.black12,
                ),
              ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
