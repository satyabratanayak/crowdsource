import 'package:crowdsource/backend/Providers/provider_tag.dart';
import 'package:flutter/material.dart';
import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Frontend/widgets/widget_action_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final VoidCallback onTap;
  const SignInPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tagProvider = Provider.of<TagProvider>(context);
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            color: kPrimaryDark,
            child: Center(
              child: Text(
                tagProvider.isInfluencer.toString(),
                style: kStylePrimaryBold,
              ),
            ),
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
                onTap: onTap,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
