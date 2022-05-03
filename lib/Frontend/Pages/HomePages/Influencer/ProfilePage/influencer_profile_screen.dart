import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/backend/Providers/provier_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class InfluencerProfileScreen extends StatelessWidget {
  const InfluencerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
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
                builder: (_) => WarningSheet(
                  onTapPrimary: () {
                    authProvider.googleLogout();
                    Navigator.pop(context);
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const WelcomePage(),
                    //   ),
                    // );
                  },
                  primaryButtonText: "Log Out",
                  warningNote: "Are you sure ? you want to log out from the app. once you log out you will be redirected again to welcome page.",
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
    final imageUrl = FirebaseAuth.instance.currentUser?.photoURL;
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
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageUrl == null ? const AssetImage("assets/images/profileImage.png") : NetworkImage(imageUrl) as ImageProvider,
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
