import 'package:crowdsource/Frontend/widgets/scrolldown_bar.dart';
import 'package:crowdsource/Frontend/widgets/title_card.dart';
import 'package:crowdsource/Frontend/widgets/widget_action_button.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';

class EventWarningSheet extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const EventWarningSheet({Key? key, required this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kFullCurve,
        color: Colors.white,
      ),
      height: getHeight(250),
      child: Stack(
        children: [
          Padding(
            padding: kFullPad,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleHeading(title: "Warning"),
                    Text(
                      "If you OPEN The link it will be marked as you registered this event so, if you don't want to register this event then just slide down the white sheet.",
                      style: kStylePrimaryPara,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        color: kSecondaryText,
                        textColor: kPrimaryText,
                        height: getHeight(60),
                        title: title,
                        onTap: onTap,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const ScrollDownBar()
        ],
      ),
    );
  }
}
