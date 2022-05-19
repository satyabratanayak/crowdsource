import 'package:crowdsource/Frontend/Pages/HomePages/Participant/ContestPage/participant_contest_details_screen.dart';
import 'package:crowdsource/Utilities/import.dart';

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
              children: [
                PostCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ParticipantContestDetailScreen(
                          date: "23",
                          month: "APR",
                          isOnline: true,
                          postTitle: "The New Post",
                          profilePic: "assets/images/profile.png",
                          posterImg: "assets/images/img1.jpg",
                          time: "8:00 AM",
                          eventCreator: 'Satyabrata Nayak',
                          agenda:
                              "This is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event.",
                          contestLink: '',
                          eventLink: '',
                        ),
                      ),
                    );
                  },
                  date: "23",
                  month: "APR",
                  isEvent: true,
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
