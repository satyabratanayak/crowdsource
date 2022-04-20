import 'package:crowdsource/Frontend/widgets/title_card.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:flutter/material.dart';

class ParticipantEventScreen extends StatelessWidget {
  const ParticipantEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kSingleHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          TitleHeading(title: "Contests"),
        ],
      ),
    );
  }
}
