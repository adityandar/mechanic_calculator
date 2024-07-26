import 'package:flutter/material.dart';
import 'package:mechanic_calculator/styles/index.dart';

class MyTheme {
  const MyTheme._();

  static SliderThemeData slider() => SliderThemeData(
        trackShape: _CustomTrackShape(),
        activeTrackColor: ColorStyle.primaryBlueColor,
        overlayColor: ColorStyle.blackColor.withOpacity(0.3),
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 10,
        ),
        trackHeight: 8,
      );
}

class _CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
