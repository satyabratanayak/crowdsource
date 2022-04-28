import 'package:crowdsource/Frontend/Pages/WelcomePage/welcome_page.dart';
import 'package:crowdsource/Frontend/widgets/event_waning_sheet.dart';
import 'package:crowdsource/Frontend/widgets/showsnack.dart';
import 'package:crowdsource/Frontend/widgets/title_card.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfluencerProfileScreen extends StatelessWidget {
  const InfluencerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kSingleHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleHeading(title: "Profile Card"),
          const ProfileCard(),
          const TitleHeading(title: "Stats"),
          SettingsButton(
              onTap: () {
                showButtonsnack(context, "We are working on it,");
              },
              title: "All Events"),
          SizedBox(height: getHeight(20)),
          SettingsButton(
              onTap: () {
                showButtonsnack(context, "We are working on it,");
              },
              title: "FeedBack"),
          const TitleHeading(title: "Settings"),
          SettingsButton(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (_) => EventWarningSheet(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomePage(),
                      ),
                    );
                  },
                  title: "Log Out",
                ),
              );
            },
            title: "Log Out",
          )
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const SettingsButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        height: getHeight(50),
        decoration: BoxDecoration(
          color: kPrimaryLight,
          borderRadius: kHalfCurve,
        ),
        child: Padding(
          padding: kFullHorizontal,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: kStylePrimaryButtonLight,
              ),
              const Spacer(),
              SvgPicture.asset("assets/icons/icon_next.svg")
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: kPrimaryLight,
        borderRadius: kHalfCurve,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: kHalfPad,
              child: Container(
                decoration: BoxDecoration(
                  color: kPrimaryDark,
                  borderRadius: kHalfCurve,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/profile.png"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: kHalfPad,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Satyabrata Nayak",
                    style: kStylePrimaryHeading,
                  ),
                  Text(
                    "Satyabratana...@gmail.com",
                    style: kStylePrimaryPara,
                  ),
                  SizedBox(
                    height: getHeight(10),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: getHeight(25),
                          decoration: BoxDecoration(
                            color: kPrimaryDark,
                            borderRadius: kQuatCurve,
                          ),
                          child: Center(
                            child: Text(
                              "Registered Events",
                              style: kStyleSecondaryPara,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getWidth(10),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: getHeight(25),
                          decoration: BoxDecoration(
                            color: kPrimaryDark,
                            borderRadius: kQuatCurve,
                          ),
                          child: Center(
                            child: Text(
                              "22",
                              style: kStyleSecondaryPara,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
