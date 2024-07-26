import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/calculator/calculator_cubit.dart';
import 'package:mechanic_calculator/styles/index.dart';

import '../widgets/index.dart';

class CalculatorHeaderView extends StatelessWidget {
  const CalculatorHeaderView({
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
            'Mechanic Calculator',
            style: TypoStyle.h2(context).copyWith(
              color: ColorStyle.fullWhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(24),
          BlocBuilder<CalculatorCubit, CalculatorState>(
            builder: (context, state) {
              return CalculatorPriceInformationWidget(
                totalPrice: state.totalPrice,
                totalCapital: state.totalCapital,
                totalProfit: state.totalProfit,
              );
            },
          ),
          const Gap(24),
        ],
      ),
    );
  }
}
