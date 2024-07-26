import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mechanic_calculator/pages/index.dart';
import 'package:mechanic_calculator/styles/index.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    );
  }
}
