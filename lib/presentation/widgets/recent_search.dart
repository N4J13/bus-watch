import 'package:bus_proj/bloc/bus_bloc.dart';
import 'package:bus_proj/bloc/bus_state.dart';
import 'package:bus_proj/constants/app_color.dart';
import 'package:bus_proj/presentation/presentation.dart';
import 'package:bus_proj/presentation/widgets/common/app_custom_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final busBloc = BlocProvider.of<BusBloc>(context)..getRecentSearch();
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<BusBloc, BusState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Search History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        busBloc.clearRecentSearch();
                      },
                      child: const Text(
                        'Clear All',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final searchRecord = busBloc.searchRecords[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            AppCustomRoute(screen: const RoutesScreen()));
                      },
                      child: ListTile(
                        title: Text(
                            ' ${searchRecord.departure} - ${searchRecord.destination}'),
                        trailing: Icon(PhosphorIcons.caretRight(),
                            color: AppColors.primary),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: busBloc.searchRecords.length,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
