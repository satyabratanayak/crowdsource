import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';

class BuildIconBackground extends StatelessWidget {
  final double backgroundSize;
  final Color iconBackgoundColor;
  final double barHeight;
  final double totalPadding;

  const BuildIconBackground({
    required this.backgroundSize,
    required this.iconBackgoundColor,
    required this.barHeight,
    Key? key,
    required this.totalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double maxElementWidth = (deviceWidth - totalPadding) / 4;
    return SizedBox(
      width: maxElementWidth,
      height: barHeight,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: getHeight(40),
          width: getWidth(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: iconBackgoundColor,
          ),
        ),
      ),
    );
  }
}
