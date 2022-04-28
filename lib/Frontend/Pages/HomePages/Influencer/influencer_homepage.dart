import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/ContestPage/influencer_contest_screen.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/EventPage/influencer_event_screen.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/HomePage/influencer_home_screen.dart';
import 'package:crowdsource/Frontend/Pages/HomePages/Influencer/ProfilePage/influencer_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:crowdsource/Frontend/widgets/BottomBar/bottom_bar.dart';
import 'package:crowdsource/Frontend/widgets/widget_appbar.dart';
import 'package:crowdsource/Utilities/constants.dart';

class InfluencerHomePage extends StatefulWidget {
  const InfluencerHomePage({Key? key}) : super(key: key);

  @override
  State<InfluencerHomePage> createState() => _InfluencerHomePageState();
}

class _InfluencerHomePageState extends State<InfluencerHomePage> {
  int selectedIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDark,
      appBar: const WidgetAppBar(),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          InfluencerHomeScreen(),
          InfluencerEventScreen(),
          InfluencerContestScreen(),
          InfluencerProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavigateBar(
        inactiveIconColor: kPrimaryText,
        activeSliderColour: kPrimaryText,
        backgroundColor: kPrimaryDark,
        // bottomPadding: getHeight(30),
        onItemSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 500), curve: Curves.easeOutQuad);
        },
        selectedIndex: selectedIndex,
        barItems: [
          BarItem(filledIcon: "assets/icons/icon_home_selected.svg", outlinedIcon: "assets/icons/icon_home.svg"),
          BarItem(filledIcon: "assets/icons/icon_event_selected.svg", outlinedIcon: "assets/icons/icon_event.svg"),
          BarItem(filledIcon: "assets/icons/icon_contest_selected.svg", outlinedIcon: "assets/icons/icon_contest.svg"),
          BarItem(filledIcon: "assets/icons/icon_profile_selected.svg", outlinedIcon: "assets/icons/icon_profile.svg"),
        ],
        navigationBackgroundColour: kPrimaryLight,
      ),
    );
  }
}
