import 'package:crowdsource/Frontend/Global/Widgets/widget_infocard.dart';
import 'package:crowdsource/Utilities/import.dart';
import 'package:url_launcher/url_launcher.dart';

class ParticipantContestDetailScreen extends StatelessWidget {
  final String eventLink;
  final String contestLink;
  final String agenda;
  final String time;
  final String eventCreator;
  final String posterImg;
  final String profilePic;
  final String postTitle;
  final bool isOnline;
  final String date;
  final String month;
  const ParticipantContestDetailScreen({
    Key? key,
    required this.posterImg,
    required this.time,
    required this.profilePic,
    required this.postTitle,
    required this.isOnline,
    required this.date,
    required this.month,
    required this.eventCreator,
    required this.agenda,
    required this.contestLink,
    required this.eventLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDark,
      appBar: const WidgetAppBar(
        isDetailPage: true,
      ),
      body: Column(
        children: [
          Container(
            height: getHeight(203),
            decoration: BoxDecoration(
              color: kSecondaryText,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(posterImg),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(415),
            child: SingleChildScrollView(
              child: Padding(
                padding: kFullHorizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(30),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(profilePic),
                        ),
                        SizedBox(
                          width: getWidth(15),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              postTitle,
                              style: kStyleSecondaryBold,
                            ),
                            Text(
                              "by $eventCreator",
                              style: kStyleSecondaryPara,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getHeight(30),
                    ),
                    InfoCard(
                      month: month,
                      date: date,
                      time: time,
                      isEvent: false,
                      isOnline: isOnline,
                    ),
                    const TitleHeading(title: "Agenda"),
                    Text(
                      agenda,
                      style: kStyleParagraph,
                    ),
                    SizedBox(
                      height: getHeight(30),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: getHeight(80),
        color: kPrimaryLight,
        child: Padding(
          padding: kSingleHorizontal,
          child: Align(
            alignment: Alignment.centerRight,
            child: ActionButton(
              width: getWidth(140),
              textColor: kPrimaryText,
              color: kSecondaryText,
              title: "Register",
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => WarningSheet(
                    warningNote:
                        "If you OPEN The link it will be marked as you registered this event/contest and redirected to the link so, if you don't want to register this event/contest then just slide down the white sheet.",
                    primaryButtonText: "Register Event",
                    secondaryButtonText: "Register Contest",
                    onTapPrimary: () {
                      launch(eventLink);
                    },
                    onTapSecondary: () {
                      launch(contestLink);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
