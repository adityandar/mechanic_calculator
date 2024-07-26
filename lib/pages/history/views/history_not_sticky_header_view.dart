import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/styles/index.dart';

import '../widgets/index.dart';

class HistoryNotStickyHeaderView extends StatelessWidget {
  const HistoryNotStickyHeaderView({
    super.key,
    required this.totalProfit,
    required this.totalCapital,
    required this.workAmount,
    required this.totalComponent,
  });

  final int totalProfit;
  final int totalCapital;
  final int workAmount;
  final int totalComponent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorStyle.primaryBlueColor,
            ColorStyle.primaryBlueColor2,
          ],
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          const Gap(12),
          HistoryTotalInformationWidget(
            totalProfit: totalProfit,
            totalCapital: totalCapital,
            workAmount: workAmount,
            totalComponent: totalComponent,
          ),
          const Gap(24),
        ],
      ),
    );
  }
}
