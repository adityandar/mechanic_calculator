import 'package:flutter/material.dart';
import 'package:mechanic_calculator/styles/index.dart';

class PriceInformationBox extends StatelessWidget {
  const PriceInformationBox({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 12,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorStyle.blackColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorStyle.blackColor.withOpacity(0.5),
            blurRadius: 12,
            offset: const Offset(0, 0),
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
