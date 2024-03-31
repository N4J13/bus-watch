import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/models/get_route_model.dart';
import 'package:bus_proj/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({
    super.key,
    required this.stations,
    required this.i,
  });
  final List<StationElement> stations;
  final int i;

  @override
  Widget build(BuildContext context) {
    final BusBloc bloc = context.read<BusBloc>();
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLast = i == stations.length - 1;
    final bool departureOrDestination = stations[i]
            .station
            .toLowerCase()
            .contains(bloc.departureController.text.toLowerCase()) ||
        stations[i]
            .station
            .toLowerCase()
            .contains(bloc.destinationController.text.toLowerCase());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10),
          child: Row(
            children: [
              SizedBox(width: screenSize.width * 0.09),
              SizedBox(
                width: screenSize.width * 0.2,
                child: Text(stations[i].arrivalTime,
                    style: departureOrDestination
                        ? TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onBackground,
                          )
                        : TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade500,
                          )),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenSize.width * 0.45,
                      child: Text(
                        stations[i].station.capitalize(),
                        style: departureOrDestination
                            ? TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Theme.of(context).colorScheme.onBackground,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              )
                            : TextStyle(
                              overflow: TextOverflow.ellipsis,
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          left: 25,
          child: Container(
            height: isLast ? screenSize.height * 0.05 : screenSize.height * 0.7,
            width: 1.0,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        Positioned(
          bottom: -25,
          left: -20,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
