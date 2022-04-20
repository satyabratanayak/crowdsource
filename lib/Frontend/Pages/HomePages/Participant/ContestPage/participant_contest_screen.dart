import 'package:crowdsource/Frontend/widgets/post_card.dart';
import 'package:crowdsource/Frontend/widgets/title_card.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';

class ParticipantContestScreen extends StatelessWidget {
  const ParticipantContestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kSingleHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleHeading(title: "Contests"),
          SizedBox(
            height: getHeight(550),
            child: ListView(
              children: const [
                PostCard(
                  date: "23",
                  month: "APR",
                  isContest: true,
                  isOnline: true,
                  postTitle: "The New Post",
                  profilePic: "assets/images/profile.png",
                  posterImg: "assets/images/img1.jpg",
                  time: "8:00 AM",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
