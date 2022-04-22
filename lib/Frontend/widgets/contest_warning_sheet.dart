import 'package:crowdsource/Frontend/widgets/scrolldown_bar.dart';
import 'package:crowdsource/Frontend/widgets/title_card.dart';
import 'package:crowdsource/Frontend/widgets/widget_action_button.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContestWarningSheet extends StatelessWidget {
  const ContestWarningSheet({Key? key}) : super(key: key);

  _launchURL(bool isContest) async {
    if (isContest) {
      launch('https://flutter.dev');
    } else {
      launch('https://dribbble.com');
    }
  }

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
                    const TitleHeading(title: "Waring"),
                    Text(
                      "If you OPEN The link it will be marked as you registered this event/contest so, if you don't want to register this event/contest then just slide down the white sheet.",
                      style: kStylePrimaryPara,
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ActionButton(
                        hasSvg: false,
                        color: kSecondaryText,
                        textColor: kPrimaryText,
                        height: getHeight(60),
                        title: "Register Event",
                        onTap: () => _launchURL(false),
                      ),
                    ),
                    SizedBox(
                      width: getWidth(20),
                    ),
                    Expanded(
                      child: ActionButton(
                        hasSvg: false,
                        color: kSecondaryText,
                        textColor: kPrimaryText,
                        height: getHeight(60),
                        title: "Register Contest",
                        onTap: () => _launchURL(true),
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
