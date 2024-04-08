import 'package:bus_proj/bloc/bloc.dart';
import 'package:bus_proj/constants/app_color.dart';
import 'package:bus_proj/presentation/presentation.dart';
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
        return busBloc.searchRecords.isNotEmpty
            ? Container(
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
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  busBloc.clearRecentSearch();
                                },
                                child: const Text(
                                  'Clear All',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const PhosphorIcon(PhosphorIconsBold.x, size: 19),
                            ],
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
                              busBloc.getRoutes(
                                  searchDeparture: searchRecord.departure,
                                  searchDestination: searchRecord.destination);
                              Navigator.push(context,
                                  AppCustomRoute(screen: const RoutesScreen()));
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
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
              )
            : const SizedBox();
      },
    );
  }
}
