import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/components/index.dart';
import 'package:mechanic_calculator/helpers/currency_helper.dart';
import 'package:mechanic_calculator/styles/index.dart';

class CalculatorPriceInformationWidget extends StatelessWidget {
  const CalculatorPriceInformationWidget({
    super.key,
    required this.totalPrice,
    required this.totalCapital,
    required this.totalProfit,
  });

  final double totalPrice;
  final double totalCapital;
  final double totalProfit;

  @override
  Widget build(BuildContext context) {
    return PriceInformationBox(
      child: Column(
        children: [
          Text(
            CurrencyHelper.formattedDollarMoney(
              amount: totalPrice,
            ),
            style: TypoStyle.d3(context).copyWith(
              color: ColorStyle.whiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Total Harga',
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
                  'Total Modal',
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
                Text(
                  CurrencyHelper.formattedDollarMoney(
                    amount: totalCapital,
                  ),
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
                  'Total Keuntungan',
                  style: TypoStyle.b2(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
                Text(
                  CurrencyHelper.formattedDollarMoney(
                    amount: totalProfit,
                    prefix: '+',
                  ),
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
