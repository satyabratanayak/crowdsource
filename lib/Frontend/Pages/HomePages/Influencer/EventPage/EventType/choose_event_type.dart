import 'package:crowdsource/Frontend/widgets/optioncard.dart';
import 'package:crowdsource/Frontend/widgets/widget_action_button.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:crowdsource/backend/Providers/provider_event.dart';
import 'package:flutter/material.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:provider/provider.dart';

class ChooseEventType extends StatefulWidget {
  final VoidCallback onTap;
  const ChooseEventType({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  @override
  State<ChooseEventType> createState() => _ChooseEventTypeState();
}

class _ChooseEventTypeState extends State<ChooseEventType> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context);
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
                          "This Is a",
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
                          "Select your preference accordingly your event as it is only event or has any contest ",
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
                          title: "Event",
                          onTap: () {
                            setState(() {
                              eventProvider.setTag(true);
                            });
                          },
                          description: "Only event and open for all who have registered",
                          isSelect: eventProvider.isEvent == true,
                          svgPath: "assets/svg/optionCardOne.svg",
                        ),
                      ),
                      SizedBox(
                        height: getHeight(40),
                      ),
                      Expanded(
                        child: OptionCard(
                          title: "Contest",
                          onTap: () {
                            setState(() {
                              eventProvider.setTag(false);
                            });
                          },
                          description: "This is an event, with has a contest with it",
                          isSelect: eventProvider.isEvent == false,
                          svgPath: "assets/svg/optionCardTwo.svg",
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
