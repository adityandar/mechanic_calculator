import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/styles/index.dart';

class CalculatorBodyFormView extends StatelessWidget {
  const CalculatorBodyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Jumlah Komponen',
            style: TypoStyle.b1(context).copyWith(
              color: ColorStyle.fullWhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(12),
          const TextField(
            style: TextStyle(
              color: ColorStyle.fullWhiteColor,
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: ColorStyle.primaryBlueColor,
                ),
              ),
            ),
          ),
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Persentase Keuntungan',
                style: TypoStyle.b1(context).copyWith(
                  color: ColorStyle.fullWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '0%',
                style: TypoStyle.h3(context).copyWith(
                  color: ColorStyle.fullWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Gap(12),
          Slider(
            value: 0.5,
            onChanged: (_) {},
          ),
          Transform(
            transform: Matrix4.translationValues(0, -10, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0%',
                  style: TypoStyle.l3(context).copyWith(
                    color: ColorStyle.fullWhiteColor,
                  ),
                ),
                Text(
                  '100%',
                  style: TypoStyle.l3(context).copyWith(
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
