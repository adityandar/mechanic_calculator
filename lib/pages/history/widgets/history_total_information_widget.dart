import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/components/index.dart';
import 'package:mechanic_calculator/helpers/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

class HistoryTotalInformationWidget extends StatelessWidget {
  const HistoryTotalInformationWidget({
    super.key,
    required this.totalProfit,
    required this.totalCapital,
    required this.workAmount,
    required this.totalComponent,
  });

  final double totalProfit;
  final double totalCapital;
  final int workAmount;
  final int totalComponent;

  @override
  Widget build(BuildContext context) {
    final componentText = totalComponent.toString();
    final capitalText = CurrencyHelper.formattedDollarMoney(
      amount: totalCapital,
    );
    final profitText = CurrencyHelper.formattedDollarMoney(
      amount: totalProfit,
      prefix: '+',
    );
    final workAmountText = workAmount.toString();

    return PriceInformationBox(
      child: Column(
        children: [
          Text(
            profitText,
            style: TypoStyle.d3(context).copyWith(
              color: ColorStyle.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Total Keuntungan',
            style: TypoStyle.b1(context).copyWith(
              color: ColorStyle.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Komponen',
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
                Text(
                  componentText,
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
              ],
            ),
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Modal',
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
                Text(
                  capitalText,
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
              ],
            ),
          ),
          const Gap(4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pekerjaan',
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
                Text(
                  workAmountText,
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
