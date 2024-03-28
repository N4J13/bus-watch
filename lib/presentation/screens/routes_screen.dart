import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/bloc/bus_state.dart';

import 'package:bus_proj/presentation/widgets/common/app_error_widget.dart';
import 'package:bus_proj/presentation/widgets/common/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BusBloc busBloc = context.read<BusBloc>();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
        body: BlocConsumer<BusBloc, BusState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LoadingWidget(
          isLoading: state is BusLoading,
          child: state is BusError
              ? const AppErrorWidget()
              : SafeArea(
                  child: CustomScrollView(slivers: <Widget>[
                    SliverAppBar(
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
                              busBloc.departureController.text,
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
                              busBloc.destinationController.text,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
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
                        style: Theme.of(context)
                            .iconButtonTheme
                            .style!
                            .copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
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
                                      initialTime:
                                          TimeOfDay(hour: 1, minute: 5),
                                    ));
                          },
                          style: Theme.of(context)
                              .iconButtonTheme
                              .style!
                              .copyWith(
                                backgroundColor: const MaterialStatePropertyAll(
                                  Colors.black12,
                                ),
                              ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
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
                ),
        );
      },
    ));
  }
}
