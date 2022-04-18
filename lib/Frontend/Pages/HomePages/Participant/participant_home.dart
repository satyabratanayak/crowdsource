import 'package:crowdsource/Frontend/widgets/BottomBar/bottom_bar.dart';
import 'package:crowdsource/Frontend/widgets/widget_appbar.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:flutter/material.dart';

class ParticipantHomePage extends StatefulWidget {
  const ParticipantHomePage({Key? key}) : super(key: key);

  @override
  State<ParticipantHomePage> createState() => _ParticipantHomePageState();
}

class _ParticipantHomePageState extends State<ParticipantHomePage> {
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
          Center(child: Text("Home")),
          Center(child: Text("Event")),
          Center(child: Text("Contest")),
          Center(child: Text("Profile")),
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
