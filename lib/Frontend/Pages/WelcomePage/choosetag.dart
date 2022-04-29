import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/backend/Providers/provider_tag.dart';
import 'package:provider/provider.dart';

class ChooseProfilePage extends StatefulWidget {
  final VoidCallback onTap;
  const ChooseProfilePage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<ChooseProfilePage> createState() => _ChooseProfilePageState();
}

class _ChooseProfilePageState extends State<ChooseProfilePage> {
  @override
  Widget build(BuildContext context) {
    final tagProvider = Provider.of<TagProvider>(context);
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
                          "I am a/an",
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
                          "Join the app by selecting one of the tags. Are you an influencer or a participant ?",
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
                    children: [
                      Expanded(
                        child: OptionCard(
                          onTap: () {
                            setState(() {
                              tagProvider.setTag(true);
                            });
                          },
                          description: "Create events, now with more organized",
                          isSelect: tagProvider.isInfluencer == true,
                          svgPath: "assets/svg/optionCardOne.svg",
                          title: "Influencer",
                        ),
                      ),
                      SizedBox(
                        height: getHeight(40),
                      ),
                      Expanded(
                        child: OptionCard(
                          description: "Join more events, now more easily",
                          isSelect: tagProvider.isInfluencer == false,
                          svgPath: "assets/svg/optionCardTwo.svg",
                          title: "Participants",
                          onTap: () {
                            setState(() {
                              tagProvider.setTag(false);
                            });
                          },
                        ),
                      ),
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
            alignment: Alignment.centerRight,
            child: Padding(
              padding: kSingleHorizontal,
              child: ActionButton(
                svg: "assets/icons/icon_next.svg",
                title: "Next",
                onTap: widget.onTap,
              ),
            ),
          ),
        )
      ],
    );
  }
}
