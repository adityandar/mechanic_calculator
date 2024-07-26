import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/index.dart';
import 'package:mechanic_calculator/pages/history/views/index.dart';
import 'package:mechanic_calculator/repository/index.dart';
import 'package:mechanic_calculator/services/local_storage_service.dart';
import 'package:mechanic_calculator/styles/index.dart';

import 'widgets/index.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final cubit = HistoryCubit(
    repository: CalculatorRepository(
      localStorageService: LocalStorageService(),
    ),
  );

  @override
  void initState() {
    super.initState();
    cubit.loadHistoryCubit();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: Scaffold(
        backgroundColor: ColorStyle.blackColor,
        body: CustomScrollView(
          slivers: [
            BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                return SliverStickyHeader(
                  header: const HistoryStickyHeaderView(),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        HistoryNotStickyHeaderView(
                          totalProfit: state.totalProfit,
                          totalCapital: state.totalCapital,
                          workAmount: state.workItems.length,
                          totalComponent: state.totalComponent,
                        ),
                        const Gap(16),
                        ...List.generate(
                          state.workItems.length,
                          (index) => WorkItemCard(
                            index: index,
                            workItem: state.workItems[index],
                          ),
                        ),
                        const Gap(24),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
