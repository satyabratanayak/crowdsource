import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';

class TitleHeading extends StatelessWidget {
  final String title;
  const TitleHeading({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getHeight(20),
        ),
        Text(
          title,
          style: kStylePrimaryPara,
        ),
        SizedBox(
          height: getHeight(20),
        ),
      ],
    );
  }
}
