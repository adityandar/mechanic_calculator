import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/cubits/index.dart';
import 'package:mechanic_calculator/pages/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final cubit = CalculatorCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: const Scaffold(
        backgroundColor: ColorStyle.blackColor,
        bottomNavigationBar: ActionButtonBottomView(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CalculatorHeaderView(),
              Gap(24),
              CalculatorBodyFormView(),
            ],
          ),
        ),
      ),
    );
  }
}
