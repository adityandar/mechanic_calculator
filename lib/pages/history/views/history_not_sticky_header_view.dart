import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/styles/index.dart';

import '../widgets/index.dart';

class HistoryNotStickyHeaderView extends StatelessWidget {
  const HistoryNotStickyHeaderView({super.key});

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
      child: const Column(
        children: [
          Gap(12),
          HistoryTotalInformationWidget(),
          Gap(24),
        ],
      ),
    );
  }
}
