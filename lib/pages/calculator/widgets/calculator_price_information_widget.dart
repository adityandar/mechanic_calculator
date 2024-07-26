import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/components/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

class CalculatorPriceInformationWidget extends StatelessWidget {
  const CalculatorPriceInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PriceInformationBox(
      child: Column(
        children: [
          Text(
            '\$300.26',
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
                  '\$200.00',
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
                  '+\$20.00',
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
