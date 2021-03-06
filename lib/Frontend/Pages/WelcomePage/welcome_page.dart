import 'package:crowdsource/Frontend/Pages/WelcomePage/choosetag.dart';
import 'package:crowdsource/Frontend/Pages/WelcomePage/signin.dart';
import 'package:crowdsource/Frontend/widgets/widget_appbar.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ChooseTag(pageController: pageController),
          SignInPage(pageController: pageController),
        ],
      ),
    );
  }
}
