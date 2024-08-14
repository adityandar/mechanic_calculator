import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/index.dart';
import 'package:mechanic_calculator/styles/index.dart';
import 'package:mechanic_calculator/utils/limit_range_text_input_formatter.dart';

class ProfitSliderView extends StatefulWidget {
  const ProfitSliderView({
    super.key,
    required this.cubit,
    required this.state,
  });

  final CalculatorCubit cubit;
  final CalculatorState state;

  @override
  State<ProfitSliderView> createState() => _ProfitSliderViewState();
}

class _ProfitSliderViewState extends State<ProfitSliderView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorState>(
        listenWhen: (previous, current) =>
            previous.profitPercentage != current.profitPercentage,
        listener: (context, state) {
          controller.text = state.profitPercentageInHundred.toString();
        },
        builder: (context, state) {
          return Column(
            children: [
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
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.right,
                      controller: controller,
                      style: TypoStyle.h3(context).copyWith(
                        color: ColorStyle.fullWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                      maxLength: 3,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LimitRangeTextInputFormatter(0, 100),
                      ],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        final oldValue = state.profitPercentage;
                        final numberValue = int.tryParse(value) ?? 0;
                        if (numberValue <= 100 && numberValue >= 0) {
                          widget.cubit
                              .updateProfitPercentage(numberValue / 100);
                        } else {
                          widget.cubit.updateProfitPercentage(oldValue);
                        }
                      },
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    ),
                  ),
                ],
              ),
              const Gap(12),
              Slider(
                value: widget.state.profitPercentage,
                divisions: 100,
                onChanged: widget.cubit.updateProfitPercentage,
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
          );
        });
  }
}
