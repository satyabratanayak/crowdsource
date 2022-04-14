import 'package:flutter/material.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Frontend/widgets/widget_action_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: kPrimaryDark,
          ),
        ),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: kSingleHorizontal,
              child: ActionButton(
                  leadingIcon: true,
                  svg: "assets/icons/icon_back.svg",
                  title: "Back",
                  onTap: () => pageController.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)),
            ),
          ),
        ),
      ],
    );
  }
}
