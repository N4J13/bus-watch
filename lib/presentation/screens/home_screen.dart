import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BusBloc busBloc = context.read<BusBloc>();

    return SafeArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).colorScheme.surface,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                title: const Text('Bus Watch'),
                floating: true,
                expandedHeight: 50,
                actions: [
                  IconButton(
                    icon: const PhosphorIcon(
                      PhosphorIconsDuotone.info,
                      size: 24,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => const InfoWidget());
                    },
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      RouteSearchWidget(
                        bloc: busBloc,
                      ),
                      const SizedBox(height: 20),
                      BusSearchWidget(
                        bloc: busBloc,
                      ),
                      const SizedBox(height: 20),
                      const RecentSearchWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
