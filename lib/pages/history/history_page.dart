import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/index.dart';
import 'package:mechanic_calculator/pages/contribution/contribution_page.dart';
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
        bottomNavigationBar: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ContributionPage()),
          ),
          child: Container(
            margin: const EdgeInsets.fromLTRB(24, 12, 24, 36),
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              color: ColorStyle.blackColor,
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  ColorStyle.primaryBlueColor,
                  ColorStyle.primaryBlueColor2,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: ColorStyle.blackColor.withOpacity(0.5),
                  blurRadius: 12,
                  offset: const Offset(0, 0),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lihat yang berkontribusi',
                  style: TypoStyle.b1(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: ColorStyle.fullWhiteColor,
                ),
              ],
            ),
          ),
        ),
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
