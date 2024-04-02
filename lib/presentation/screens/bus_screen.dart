import 'package:bus_proj/bloc/bloc.dart';
import 'package:bus_proj/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusScreen extends StatelessWidget {
  const BusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BusBloc busBloc = context.read<BusBloc>();

    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.primary,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          body: BlocConsumer<BusBloc, BusState>(
            listener: (context, state) {},
            builder: (context, state) {
              return LoadingWidget(
                isLoading: state is BusLoading,
                child: state is BusError
                    ? AppErrorWidget(
                        error: state.message,
                      )
                    : CustomScrollView(slivers: <Widget>[
                        RouteSearchAppBar(
                          bloc: busBloc,
                          isVehicleSearch: true,
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16),
                          sliver: SliverList.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16.0),
                              itemCount: busBloc.vehiclesData.length,
                              itemBuilder: (context, index) {
                                final data = busBloc.vehiclesData[index];
                                return Card(
                                    child: RouteTimeline(
                                  isVehicleSearch: true,
                                  stations: data.stations,
                                  vehicleNumber: busBloc.vehicleController.text,
                                ));
                              }),
                        ),
                      ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
