import 'package:flutter/material.dart';

class TypoStyle {
  const TypoStyle._();

  static TextStyle d1(BuildContext context) =>
      Theme.of(context).textTheme.displayLarge ?? const TextStyle();
  static TextStyle d2(BuildContext context) =>
      Theme.of(context).textTheme.displayMedium ?? const TextStyle();
  static TextStyle d3(BuildContext context) =>
      Theme.of(context).textTheme.displaySmall ?? const TextStyle();

  static TextStyle h1(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge ?? const TextStyle();
  static TextStyle h2(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium ?? const TextStyle();
  static TextStyle h3(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall ?? const TextStyle();

  static TextStyle l1(BuildContext context) =>
      Theme.of(context).textTheme.labelLarge ?? const TextStyle();
  static TextStyle l2(BuildContext context) =>
      Theme.of(context).textTheme.labelMedium ?? const TextStyle();
  static TextStyle l3(BuildContext context) =>
      Theme.of(context).textTheme.labelSmall ?? const TextStyle();

  static TextStyle b1(BuildContext context) =>
      Theme.of(context).textTheme.bodyLarge ?? const TextStyle();
  static TextStyle b2(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium ?? const TextStyle();
  static TextStyle b3(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall ?? const TextStyle();
}
