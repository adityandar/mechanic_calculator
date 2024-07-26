import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/calculator/calculator_cubit.dart';
import 'package:mechanic_calculator/styles/index.dart';

class CalculatorBodyFormView extends StatelessWidget {
  const CalculatorBodyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CalculatorCubit>();

    return BlocBuilder<CalculatorCubit, CalculatorState>(
      builder: (context, state) {
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
              TextField(
                key: ValueKey('component_textfield_flag_${state.isLoading}'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                onTapOutside: (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: (value) {
                  final valueInNumber = int.tryParse(value) ?? 0;
                  cubit.updateComponentAmount(valueInNumber);
                },
                style: const TextStyle(
                  color: ColorStyle.fullWhiteColor,
                ),
                decoration: const InputDecoration(
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
                    '${state.profitPercentageInHundred}%',
                    style: TypoStyle.h3(context).copyWith(
                      color: ColorStyle.fullWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Slider(
                value: state.profitPercentage,
                onChanged: cubit.updateProfitPercentage,
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
      },
    );
  }
}
