import 'package:crowdsource/Utilities/constants.dart';
import 'package:flutter/material.dart';

class ScrollDownBar extends StatelessWidget {
  const ScrollDownBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 5,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kSecondaryText,
          ),
        ),
      ),
    );
  }
}
