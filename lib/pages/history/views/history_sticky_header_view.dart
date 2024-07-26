import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/styles/index.dart';

class HistoryStickyHeaderView extends StatelessWidget {
  const HistoryStickyHeaderView({
    super.key,
  });

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
          const Gap(kToolbarHeight),
          Text(
            'History',
            style: TypoStyle.h2(context).copyWith(
              color: ColorStyle.fullWhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(12),
        ],
      ),
    );
  }
}
