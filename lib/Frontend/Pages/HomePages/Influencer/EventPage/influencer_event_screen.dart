import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/EventPage/EventType/create_new_event.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Participant/EventPage/participant_event_detail_screen.dart';

class InfluencerEventScreen extends StatelessWidget {
  const InfluencerEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kSingleHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: kHalfVertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TitleHeading(title: "Events"),
                ActionButton(
                  title: "New",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateNewEventScreen(),
                        ));
                  },
                  svg: "assets/icons/icon_add.svg",
                  color: kPrimaryText,
                  textColor: kPrimaryLight,
                ),
              ],
            ),
          ),
          SizedBox(
            height: getHeight(540),
            child: ListView(
              children: [
                PostCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ParticipantEventDetailScreen(
                          date: "23",
                          month: "APR",
                          isContest: false,
                          isOnline: true,
                          postTitle: "The New Post",
                          profilePic: "assets/images/profile.png",
                          posterImg: "assets/images/img1.jpg",
                          time: "8:00 AM",
                          eventCreator: 'Satyabrata Nayak',
                          agenda:
                              "This is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event.",
                        ),
                      ),
                    );
                  },
                  date: "23",
                  month: "APR",
                  isContest: false,
                  isOnline: true,
                  postTitle: "The New Post",
                  profilePic: "assets/images/profile.png",
                  posterImg: "assets/images/img1.jpg",
                  time: "8:00 AM",
                ),
                PostCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ParticipantEventDetailScreen(
                          date: "23",
                          month: "APR",
                          isContest: false,
                          isOnline: true,
                          postTitle: "The New Post",
                          profilePic: "assets/images/profile.png",
                          posterImg: "assets/images/img2.jpg",
                          time: "8:00 AM",
                          eventCreator: 'Satyabrata Nayak',
                          agenda:
                              "This is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event.",
                        ),
                      ),
                    );
                  },
                  date: "23",
                  month: "APR",
                  isContest: false,
                  isOnline: true,
                  postTitle: "The New Post",
                  profilePic: "assets/images/profile.png",
                  posterImg: "assets/images/img2.jpg",
                  time: "8:00 AM",
                ),
                PostCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ParticipantEventDetailScreen(
                          date: "23",
                          month: "APR",
                          isContest: false,
                          isOnline: true,
                          postTitle: "The New Post",
                          profilePic: "assets/images/profile.png",
                          posterImg: "assets/images/img3.jpg",
                          time: "8:00 AM",
                          eventCreator: 'Satyabrata Nayak',
                          agenda:
                              "This is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event.",
                        ),
                      ),
                    );
                  },
                  date: "23",
                  month: "APR",
                  isContest: false,
                  isOnline: true,
                  postTitle: "The New Post",
                  profilePic: "assets/images/profile.png",
                  posterImg: "assets/images/img3.jpg",
                  time: "8:00 AM",
                ),
                PostCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ParticipantEventDetailScreen(
                          date: "23",
                          month: "APR",
                          isContest: false,
                          isOnline: true,
                          postTitle: "The New Post",
                          profilePic: "assets/images/profile.png",
                          posterImg: "assets/images/img4.jpg",
                          time: "8:00 AM",
                          eventCreator: 'Satyabrata Nayak',
                          agenda:
                              "This is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event. \n\nThis is a long description of the post of the event, under 1000 Letters in it, for the explanation of the event and why one should join it. and also if possible anything that the participant should know about this event.",
                        ),
                      ),
                    );
                  },
                  date: "23",
                  month: "APR",
                  isContest: false,
                  isOnline: true,
                  postTitle: "The New Post",
                  profilePic: "assets/images/profile.png",
                  posterImg: "assets/images/img4.jpg",
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
