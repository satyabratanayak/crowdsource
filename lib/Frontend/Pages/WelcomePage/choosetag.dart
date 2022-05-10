import 'package:crowdsource/Utilities/import.dart';
import 'package:crowdsource/backend/Providers/provider_tag.dart';
import 'package:provider/provider.dart';

class ChooseProfilePage extends StatefulWidget {
  final VoidCallback onTapPageNavigation;
  const ChooseProfilePage({Key? key, required this.onTapPageNavigation}) : super(key: key);

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
              const Expanded(
                flex: 4,
                child: HeaderElement(
                  heading: "I am a/an",
                  description: "Join the app by selecting one of the tags. Are you an influencer or a participant ?",
                ),
              ),
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
          child: NavigationButton(
            svg: "assets/icons/icon_next.svg",
            title: "Next",
            onTapPageNavigation: widget.onTapPageNavigation,
            leading: false,
          ),
        )
      ],
    );
  }
}
