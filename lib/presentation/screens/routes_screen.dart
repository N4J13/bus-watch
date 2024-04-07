import 'package:bus_proj/bloc/bloc.dart';
import 'package:bus_proj/presentation/widgets/common/app_error_widget.dart';
import 'package:bus_proj/presentation/widgets/common/loading_widget.dart';
import 'package:bus_proj/presentation/widgets/route_search_app_bar.dart';
import 'package:bus_proj/presentation/widgets/route_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
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
                      ),
                      SliverPadding(
                        padding: EdgeInsets.only(
                          left: screenWidth * 0.04,
                          right: screenWidth * 0,
                          top: screenHeight * 0.02,
                        ),
                        sliver: SliverList.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16.0),
                            itemCount: busBloc.routesData.length,
                            itemBuilder: (context, index) {
                              final data = busBloc.routesData[index];
                              return Card(
                                  child: RouteTimeline(
                                stations: data.stations,
                                vehicleNumber: data.vehicleNumber,
                              ));
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
