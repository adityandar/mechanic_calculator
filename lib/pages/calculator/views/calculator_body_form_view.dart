import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/calculator/calculator_cubit.dart';
import 'package:mechanic_calculator/pages/index.dart';
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
              const ComponentPriceView(),
              const Gap(4),
              Text(
                'Jumlah Komponen',
                style: TypoStyle.b1(context).copyWith(
                  color: ColorStyle.fullWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(12),
              TextField(
                key: ValueKey('component_textfield_flag_${state.rebuildFlag}'),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                onTapOutside: (PointerDownEvent event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                onChanged: cubit.updateComponentAmountValues,
                style: const TextStyle(
                  color: ColorStyle.fullWhiteColor,
                ),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorStyle.primaryBlueColor,
                    ),
                  ),
                  // TODO(adityandar): add shortcut bottom sheet
                  // suffixIcon: InkWell(
                  //   onTap: () {
                  //     ToolShortcutBottomSheet.show(context);
                  //   },
                  //   child: const Icon(
                  //     Icons.dataset_outlined,
                  //     color: ColorStyle.fullWhiteColor,
                  //   ),
                  // ),
                ),
              ),
              ProfitSliderView(
                cubit: cubit,
                state: state,
              ),
              const Gap(24),
              Row(
                children: [
                  Checkbox(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: const VisualDensity(
                      horizontal: -4,
                      vertical: -4,
                    ),
                    value: state.isRoundAllNumbers,
                    onChanged: cubit.updateIsRoundAllNumbers,
                  ),
                  const Gap(8),
                  Text(
                    'Bulatkan harga',
                    style: TypoStyle.l1(context).copyWith(
                      color: ColorStyle.fullWhiteColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
