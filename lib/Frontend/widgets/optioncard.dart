import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionCard extends StatefulWidget {
  final String svgPath;
  final bool isSelect;
  final VoidCallback? onTap;
  final String title;
  final String description;
  const OptionCard({
    Key? key,
    required this.svgPath,
    required this.isSelect,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kSingleCurve,
          border: Border.all(width: getHeight(2), color: kPrimaryLight),
          color: widget.isSelect ? kPrimaryLight : kPrimaryDark,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: CircleAvatar(
                  child: SvgPicture.asset(
                    widget.svgPath,
                    height: getHeight(80),
                  ),
                  backgroundColor: kPrimaryLight,
                  radius: getHeight(30),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(right: getWidth(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: kStyleSecondaryBold,
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      widget.description,
                      style: kStyleSecondaryPara,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
