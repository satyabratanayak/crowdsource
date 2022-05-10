import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/backend/Providers/provider_tag.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final VoidCallback onTapPageNavigation;
  final VoidCallback onTapSignInWithGoogle;
  final VoidCallback ontapTwitter;
  final VoidCallback onTapGitHub;
  final VoidCallback onTapApple;
  const SignInPage({
    Key? key,
    required this.onTapPageNavigation,
    required this.onTapSignInWithGoogle,
    required this.ontapTwitter,
    required this.onTapGitHub,
    required this.onTapApple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tagProvider = Provider.of<TagProvider>(context);
    bool isInf = tagProvider.isInfluencer;
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: HeaderElement(
                  heading: isInf ? "Sign in as influencer" : "Sign in as participant",
                  description: "Choose the best social login for joining google crowsource ?",
                ),
              ),
              Expanded(
                flex: 9,
                child: SocialLogins(
                  ontapTwitter: ontapTwitter,
                  onTapSignInWithGoogle: onTapSignInWithGoogle,
                  onTapApple: onTapApple,
                  onTapGitHub: onTapGitHub,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: NavigationButton(
            svg: "assets/icons/icon_back.svg",
            title: "Back",
            onTapPageNavigation: onTapPageNavigation,
            leading: true,
          ),
        ),
      ],
    );
  }
}

class SocialLogins extends StatelessWidget {
  const SocialLogins({
    Key? key,
    required this.ontapTwitter,
    required this.onTapGitHub,
    required this.onTapApple,
    required this.onTapSignInWithGoogle,
  }) : super(key: key);

  final VoidCallback ontapTwitter;
  final VoidCallback onTapGitHub;
  final VoidCallback onTapApple;
  final VoidCallback onTapSignInWithGoogle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDoublePad,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SocialButtons(
                onTap: onTapApple,
                svgPath: "assets/icons/icon_apple.svg",
              ),
              SocialButtons(
                onTap: onTapGitHub,
                svgPath: "assets/icons/icon_github.svg",
              ),
              SocialButtons(
                onTap: ontapTwitter,
                svgPath: "assets/icons/icon_twitter.svg",
              ),
            ],
          ),
          SizedBox(
            height: getHeight(20),
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Divider(
                  thickness: 1.5,
                  color: kPrimaryLight,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Text('or', style: kStylePrimaryPara),
                ),
              ),
              const Expanded(
                flex: 3,
                child: Divider(
                  thickness: 1.5,
                  color: kPrimaryLight,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getHeight(20),
          ),
          GoogleButton(onTap: onTapSignInWithGoogle)
        ],
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryText,
          borderRadius: kHalfCurve,
        ),
        height: getHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/icon_google.svg"),
            SizedBox(
              width: getWidth(10),
            ),
            Text(
              "Continue with Google",
              style: kStylePrimaryButton,
            )
          ],
        ),
      ),
    );
  }
}

class SocialButtons extends StatelessWidget {
  final String svgPath;
  const SocialButtons({
    Key? key,
    required this.onTap,
    required this.svgPath,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: getHeight(60),
        width: getWidth(80),
        decoration: BoxDecoration(
          color: kPrimaryLight,
          borderRadius: kHalfCurve,
        ),
        child: Center(
          child: SvgPicture.asset(svgPath),
        ),
      ),
    );
  }
}
