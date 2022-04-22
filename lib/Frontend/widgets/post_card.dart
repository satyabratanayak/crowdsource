import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PostCard extends StatelessWidget {
  final VoidCallback onTap;
  final String time;
  final String posterImg;
  final String profilePic;
  final String postTitle;
  final bool isOnline;
  final bool isContest;
  final String date;
  final String month;
  const PostCard({
    Key? key,
    required this.date,
    required this.month,
    required this.isOnline,
    required this.isContest,
    required this.postTitle,
    required this.profilePic,
    required this.posterImg,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHalfVertical,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: getHeight(220),
          decoration: BoxDecoration(
            color: kPrimaryLight,
            borderRadius: kHalfCurve,
          ),
          child: Column(
            children: [
              SizedBox(
                height: getHeight(10),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: kHalfHorizontal,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kSecondaryText,
                          borderRadius: kQuatCurve,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(posterImg),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: kHalfPad,
                          child: Container(
                            width: getWidth(30),
                            height: getHeight(40),
                            decoration: BoxDecoration(
                              color: kPrimaryText,
                              borderRadius: kQuatCurve,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  month,
                                  style: kCalenderText,
                                ),
                                SizedBox(
                                  height: getHeight(3),
                                ),
                                Text(
                                  date,
                                  style: kCalenderText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: kHalfHorizontal,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(profilePic),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postTitle,
                          style: kStyleSecondaryHeading,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(isContest ? "assets/icons/icon_graduation.svg" : "assets/icons/icon_map.svg"),
                            SizedBox(
                              width: getWidth(10),
                            ),
                            Text(
                              isOnline ? "Online " : "Offline",
                              style: kStyleSecondaryPara,
                            ),
                            Text(
                              isContest ? "Contest" : "Event",
                              style: kStyleSecondaryPara,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: kHalfHorizontal,
                      child: Container(
                        width: getWidth(80),
                        decoration: BoxDecoration(
                          color: kPrimaryDark,
                          borderRadius: kQuatCurve,
                        ),
                        child: Center(
                            child: Text(
                          time,
                          style: kStylePrimaryPara,
                        )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
