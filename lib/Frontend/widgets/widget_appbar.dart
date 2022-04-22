import 'package:crowdsource/Utilities/constants.dart';
import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

class WidgetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDetailPage;
  const WidgetAppBar({
    Key? key,
    this.isDetailPage = false,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: kHalfHorizontal,
          child: IconButton(
            icon: const Icon(Icons.share),
            //TODO: Add App Link
            onPressed: () {
              Share.share("This is Link of App");
            },
          ),
        )
      ],
      leading: isDetailPage
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: kPrimaryText),
              onPressed: () => Navigator.of(context).pop(),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.only(left: getWidth(20)),
                child: SvgPicture.asset(
                  "assets/icons/icon_crowdsource.svg",
                ),
              ),
            ),
      title: Text('Crowdsource', style: kStylePrimaryBold),
      elevation: 0,
      backgroundColor: kPrimaryLight,
    );
  }
}
