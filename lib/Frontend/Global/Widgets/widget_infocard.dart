import 'package:crowdsource/Utilities/import.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.month,
    required this.date,
    required this.time,
    required this.isEvent,
    required this.isOnline,
  }) : super(key: key);

  final String month;
  final String date;
  final String time;
  final bool isEvent;
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
                    color: isEvent ? kEventIndicator : kContestIndicator,
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
                            SvgPicture.asset(isEvent ? "assets/icons/icon_map.svg" : "assets/icons/icon_graduation.svg"),
                            SizedBox(
                              width: getWidth(5),
                            ),
                            Text(
                              isOnline ? "Online " : "Offline ",
                              style: kStylePrimaryPara,
                            ),
                            Text(
                              isEvent ? "Event" : "Contest",
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
