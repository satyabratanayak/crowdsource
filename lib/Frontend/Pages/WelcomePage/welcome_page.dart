import 'package:crowdsource/Frontend/Pages/WelcomePage/choosetag.dart';
import 'package:crowdsource/Frontend/Pages/WelcomePage/signin.dart';
import 'package:crowdsource/Frontend/Global/Widgets/widgets_global.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/backend/Providers/provider_tag.dart';
import 'package:crowdsource/backend/Providers/provier_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final tagProvider = Provider.of<TagProvider>(context);
    bool isInfluencer = tagProvider.isInfluencer;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kPrimaryDark,
      appBar: const WidgetAppBar(),
      body: PageView(
        controller: pageController,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          ChooseProfilePage(onTap: () => pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)),
          SignInPage(
            ontapTwitter: () {
              authProvider.googleLogout();
            },
            onTapPageNavigation: () => pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
            onTapSignInWithGoogle: () async {
              await authProvider.googleLogIn(isInfluencer: isInfluencer);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return isInfluencer ? const InfluencerHomePage() : const ParticipantHomePage();
              //     },
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
