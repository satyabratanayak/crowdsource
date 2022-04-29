import 'package:crowdsource/Utilities/import.dart';
import 'package:flutter_svg/svg.dart';

class ParticipantEventDetailScreen extends StatelessWidget {
  final String agenda;
  final String time;
  final String eventCreator;
  final String posterImg;
  final String profilePic;
  final String postTitle;
  final bool isOnline;
  final bool isContest;
  final String date;
  final String month;
  const ParticipantEventDetailScreen(
      {Key? key,
      required this.posterImg,
      required this.time,
      required this.profilePic,
      required this.postTitle,
      required this.isOnline,
      required this.isContest,
      required this.date,
      required this.month,
      required this.eventCreator,
      required this.agenda})
      : super(key: key);

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
                image: AssetImage(posterImg),
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
                          backgroundImage: AssetImage(profilePic),
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
                      isContest: isContest,
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
              //TODO: Register Link
              onTap: () {
                //TODO: Dialog Box
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (_) => isContest
                      ? WarningSheet(
                          warningNote:
                              "If you OPEN The link it will be marked as you registered this event/contest so, if you don't want to register this event/contest then just slide down the white sheet.",
                          primaryButtonText: "Register Event",
                          secondaryButtonText: "Register Contest",
                          onTapPrimary: () {},
                          onTapSecondary: () {},
                        )
                      : WarningSheet(
                          warningNote:
                              "If you OPEN The link it will be marked as you registered this event/contest so, if you don't want to register this event/contest then just slide down the white sheet.",
                          primaryButtonText: "Register Event",
                          onTapPrimary: () {},
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

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.month,
    required this.date,
    required this.time,
    required this.isContest,
    required this.isOnline,
  }) : super(key: key);

  final String month;
  final String date;
  final String time;
  final bool isContest;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kFullCurve,
        color: kPrimaryLight,
      ),
      height: getHeight(85),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  month,
                  style: TextStyle(
                    color: kSecondaryText,
                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: getHeight(3),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: isContest ? kContestIndicator : kEventIndicator,
                    fontSize: getHeight(12),
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: getHeight(40),
            width: getWidth(2),
            decoration: BoxDecoration(
              borderRadius: kQuatCurve,
              color: kSecondaryText,
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: kFullPad,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          time,
                          style: kStyleSecondaryHeading,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(isContest ? "assets/icons/icon_graduation.svg" : "assets/icons/icon_map.svg"),
                            SizedBox(
                              width: getWidth(5),
                            ),
                            Text(
                              isOnline ? "Online " : "Offline ",
                              style: kStylePrimaryPara,
                            ),
                            Text(
                              isContest ? "Contest" : "Event",
                              style: kStylePrimaryPara,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: kFullPad,
                    child: Center(
                      child: Container(
                        width: getWidth(45),
                        decoration: BoxDecoration(
                          borderRadius: kHalfCurve,
                          color: kSecondaryText,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/icons/icon_calender.svg",
                            color: kPrimaryText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
