import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/backend/Providers/provider_tag.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final VoidCallback onTapPageNavigation;
  final VoidCallback onTapSignInWithGoogle;
  final VoidCallback ontapTwitter;
  const SignInPage({
    Key? key,
    required this.onTapPageNavigation,
    required this.onTapSignInWithGoogle,
    required this.ontapTwitter,
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
                  child: Padding(
                    padding: kDoubleVertical,
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      SizedBox(
                        width: getWidth(250),
                        child: Text(
                          isInf ? "Sign in as influencer" : "Sign in as participant",
                          textAlign: TextAlign.center,
                          style: kStyleSecondaryBold,
                        ),
                      ),
                      const SizedBox(
                          // height: getHeight(),
                          ),
                      SizedBox(
                        width: getWidth(280),
                        child: Text(
                          "Choose the best social login for joining google crowsource ?",
                          textAlign: TextAlign.center,
                          style: kStylePrimaryPara,
                        ),
                      ),
                    ]),
                  )),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: kDoublePad,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SocialButtons(
                            onTap: () {
                              showButtonsnack(context, "We are working on it, please try sign in with google");
                            },
                            svgPath: "assets/icons/icon_apple.svg",
                          ),
                          SocialButtons(
                            onTap: () {
                              showButtonsnack(context, "We are working on it, please try sign in with google");
                            },
                            svgPath: "assets/icons/icon_github.svg",
                          ),
                          SocialButtons(
                            onTap: () {
                              ontapTwitter;
                              showButtonsnack(context, "We are working on it, please try sign in with google");
                            },
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
                ),
              ),
            ],
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
                onTap: onTapPageNavigation,
              ),
            ),
          ),
        ),
      ],
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
