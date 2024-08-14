import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechanic_calculator/cubits/index.dart';
import 'package:mechanic_calculator/helpers/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

class ComponentPriceView extends StatefulWidget {
  const ComponentPriceView({super.key});

  @override
  State<ComponentPriceView> createState() => _ComponentPriceViewState();
}

class _ComponentPriceViewState extends State<ComponentPriceView> {
  final expandedNotifier = ValueNotifier<bool>(false);
  var componentPrice = 0.0;
  final textEditingController = TextEditingController();

  void onPriceChanged(String value) {
    double? valueInNumber;
    valueInNumber = double.tryParse(value);
    valueInNumber ??= double.tryParse(
      value.replaceAll(',', '.'),
    );

    componentPrice = valueInNumber ?? 0;
  }

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      onPriceChanged(textEditingController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: expandedNotifier,
      builder: (context, isExpanded, _) {
        return BlocBuilder<CalculatorCubit, CalculatorState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Harga Komponen: ',
                      style: TypoStyle.b1(context).copyWith(
                        color: ColorStyle.fullWhiteColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: isExpanded ? 0 : 1,
                      duration: const Duration(milliseconds: 200),
                      child: Text(
                        CurrencyHelper.formattedDollarMoney(
                          amount: state.componentPrice,
                        ),
                        style: TypoStyle.b1(context).copyWith(
                          color: ColorStyle.fullWhiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: () {
                        if (isExpanded) {
                          context
                              .read<CalculatorCubit>()
                              .updateComponentPrice(componentPrice);

                          expandedNotifier.value = !expandedNotifier.value;
                        } else {
                          textEditingController.text = state.componentPrice
                              .toStringAsFixed(2)
                              .replaceAll('.', ',');

                          expandedNotifier.value = !expandedNotifier.value;
                        }
                      },
                      icon: Icon(isExpanded ? Icons.save : Icons.edit),
                      color: ColorStyle.fullWhiteColor,
                    ),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 24),
                    child: TextField(
                      key: ValueKey(
                        'component_price_textfield_flag_${state.rebuildFlag}',
                      ),
                      controller: textEditingController,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+(\,\d*)?')),
                      ],
                      onTapOutside: (PointerDownEvent event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      // onChanged: onPriceChanged,
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
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
