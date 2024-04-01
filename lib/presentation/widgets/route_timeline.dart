import 'package:bus_proj/models/station.dart';
import 'package:bus_proj/presentation/widgets/common/timeline_widget.dart';
import 'package:bus_proj/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RouteTimeline extends StatelessWidget {
  final String vehicleNumber;
  final List<Station> stations;
  final bool isVehicleSearch;
  const RouteTimeline({
    super.key,
    required this.stations,
    required this.vehicleNumber,
    this.isVehicleSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    final String firstStation =
        stations.first.station.capitalize().createShortName();
    final String lastStation =
        stations.last.station.capitalize().createShortName();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: PhosphorIcon(
                  PhosphorIconsRegular.bus,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 25,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                isVehicleSearch
                    ? "$firstStation - $lastStation"
                    : vehicleNumber,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          for (int i = 0; i < stations.length; i++)
            TimelineWidget(
              stations: stations,
              i: i,
              isVehicleSearch: isVehicleSearch,
            ),
        ],
      ),
    );
  }
}
