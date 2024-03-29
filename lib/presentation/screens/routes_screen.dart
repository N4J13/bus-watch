import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/bloc/bus_state.dart';

import 'package:bus_proj/presentation/widgets/common/app_error_widget.dart';
import 'package:bus_proj/presentation/widgets/common/loading_widget.dart';
import 'package:bus_proj/presentation/widgets/route_search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

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
                  ? const AppErrorWidget()
                  : CustomScrollView(slivers: <Widget>[
                      RouteSearchAppBar(bloc: busBloc),
                      SliverPadding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        sliver: SliverList.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16.0),
                            itemCount: busBloc.routesData.length,
                            itemBuilder: (context, index) {
                              final data = busBloc.routesData[index];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: ExpansionPanelList(
                                  elevation: 0,
                                  children: [
                                    ExpansionPanel(
                                      headerBuilder: (context, isExpanded) {
                                        return ListTile(
                                          title: Text(
                                            "${data.stations[0].station} - ${data.stations.last.station}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                          ),
                                        );
                                      },
                                      body: Column(
                                        children: data.stations
                                            .map((e) => ListTile(
                                                  title: Text(
                                                    e.station,
                                                    style: TextStyle(
                                                        color: e.station
                                                                .toLowerCase()
                                                                .contains(busBloc
                                                                    .destinationController
                                                                    .text
                                                                    .toLowerCase())
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .primary
                                                            : Colors.black),
                                                  ),
                                                  subtitle: Text(
                                                    e.arrivalTime,
                                                  ),
                                                  isThreeLine: true,
                                                ))
                                            .toList(),
                                      ),
                                      isExpanded: true,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ]),
            );
          },
        )),
      ),
    );
  }
}
