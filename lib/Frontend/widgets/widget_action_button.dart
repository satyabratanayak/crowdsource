import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? color;
  final String? svg;
  final bool leadingIcon;

  const ActionButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.height,
    this.width,
    this.color,
    this.svg,
    this.leadingIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height ?? getHeight(45),
        width: width ?? getWidth(110),
        decoration: BoxDecoration(
          color: color ?? kPrimaryLight,
          borderRadius: kHalfCurve,
        ),
        child: leadingIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(svg ?? "assets/icons/icon_next.svg"),
                  SizedBox(
                    width: getWidth(10),
                  ),
                  Text(
                    title,
                    style: kStylePrimaryButtonLight,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: kStylePrimaryButtonLight,
                  ),
                  SizedBox(
                    width: getWidth(10),
                  ),
                  SvgPicture.asset(svg ?? "assets/icons/icon_next.svg"),
                ],
              ),
      ),
    );
  }
}
