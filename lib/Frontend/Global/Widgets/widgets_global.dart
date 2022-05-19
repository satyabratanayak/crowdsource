import 'package:crowdsource/Utilities/import.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';

// AppBarWidget
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

// Title heading
class TitleHeading extends StatelessWidget {
  final String title;
  const TitleHeading({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: getHeight(20),
        ),
        Text(
          title,
          style: kStylePrimaryPara,
        ),
        SizedBox(
          height: getHeight(20),
        ),
      ],
    );
  }
}

// Header Element
class HeaderElement extends StatelessWidget {
  final String heading;
  final String description;
  const HeaderElement({
    Key? key,
    required this.heading,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kDoubleVertical,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          width: getWidth(250),
          child: Text(
            heading,
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
            description,
            textAlign: TextAlign.center,
            style: kStylePrimaryPara,
          ),
        ),
      ]),
    );
  }
}

// Navigation Button
class NavigationButton extends StatelessWidget {
  final bool leading;
  final String svg;
  final String title;
  const NavigationButton({
    Key? key,
    required this.onTapPageNavigation,
    required this.svg,
    required this.title,
    required this.leading,
  }) : super(key: key);

  final VoidCallback onTapPageNavigation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: leading ? Alignment.centerLeft : Alignment.centerRight,
      child: Padding(
        padding: kSingleHorizontal,
        child: ActionButton(
          leadingIcon: leading,
          svg: svg,
          title: title,
          onTap: onTapPageNavigation,
        ),
      ),
    );
  }
}

// Warning sheet widget
class WarningSheet extends StatelessWidget {
  final bool primaryIsLoading;
  final bool secondaryIsLoading;
  final String warningNote;
  final VoidCallback onTapPrimary;
  final VoidCallback? onTapSecondary;
  final String primaryButtonText;
  final String? secondaryButtonText;
  const WarningSheet({
    Key? key,
    required this.primaryButtonText,
    this.secondaryButtonText,
    required this.onTapPrimary,
    this.onTapSecondary,
    required this.warningNote,
    this.primaryIsLoading = false,
    this.secondaryIsLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kFullCurve,
        color: Colors.white,
      ),
      height: getHeight(250),
      child: Stack(
        children: [
          Padding(
            padding: kFullPad,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleHeading(title: "Waring"),
                    Text(
                      warningNote,
                      style: kStylePrimaryPara,
                    )
                  ],
                ),
                secondaryButtonText == null
                    ? Row(
                        children: [
                          Expanded(
                            child: ActionButton(
                              isLoading: primaryIsLoading,
                              hasSvg: false,
                              color: kSecondaryText,
                              textColor: kPrimaryText,
                              height: getHeight(60),
                              title: primaryButtonText,
                              onTap: onTapPrimary,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: ActionButton(
                              isLoading: primaryIsLoading,
                              hasSvg: false,
                              color: kSecondaryText,
                              textColor: kPrimaryText,
                              height: getHeight(60),
                              title: primaryButtonText,
                              onTap: onTapPrimary,
                            ),
                          ),
                          SizedBox(
                            width: getWidth(20),
                          ),
                          Expanded(
                            child: ActionButton(
                              isLoading: secondaryIsLoading,
                              hasSvg: false,
                              color: kSecondaryText,
                              textColor: kPrimaryText,
                              height: getHeight(60),
                              title: secondaryButtonText!,
                              onTap: onTapSecondary ?? () {},
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          const ScrollDownBar()
        ],
      ),
    );
  }
}

// Action Button
class ActionButton extends StatelessWidget {
  final bool isLoading;
  final bool hasSvg;
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final String? svg;
  final bool leadingIcon;

  const ActionButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.height,
    this.width,
    this.color,
    this.svg,
    this.leadingIcon = false,
    this.textColor,
    this.hasSvg = true,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height ?? getHeight(45),
        width: width ?? getWidth(110),
        decoration: BoxDecoration(
          color: color ?? kPrimaryLight,
          borderRadius: kHalfCurve,
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: kPrimaryDark,
              ))
            : leadingIcon
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      hasSvg ? SvgPicture.asset(svg ?? "assets/icons/icon_next.svg") : Container(),
                      SizedBox(
                        width: getWidth(10),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: textColor ?? kSecondaryText,
                          fontSize: getHeight(14),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: textColor ?? kSecondaryText,
                          fontSize: getHeight(14),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      hasSvg
                          ? SizedBox(
                              width: getWidth(10),
                            )
                          : Container(),
                      hasSvg
                          ? SvgPicture.asset(
                              svg ?? "assets/icons/icon_next.svg",
                              color: textColor,
                            )
                          : Container(),
                    ],
                  ),
      ),
    );
  }
}

// Custom Text field form
class CustomTextFormField extends StatefulWidget {
  final TextInputAction? textInputAction;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final String? prefixText;
  final String? suffixText;
  final String labelText;
  final IconData icon;
  final bool obsecure;
  final bool isSuffix;
  final Color color;
  final double fontSize;

  const CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.textEditingController,
    required this.keyboardType,
    this.icon = Icons.account_box_rounded,
    this.obsecure = false,
    this.color = kPrimaryLight,
    this.fontSize = 15,
    this.prefixText,
    this.suffixText,
    this.onChanged,
    this.validator,
    this.isSuffix = true,
    this.maxLines,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obsecure = false;
  @override
  void initState() {
    super.initState();
    obsecure = widget.obsecure;
  }

  Icon visible = Icon(
    Icons.visibility,
    size: getWidth(25),
    color: kSecondaryText,
  );
  Icon invisible = Icon(
    Icons.visibility_off,
    size: getWidth(25),
    color: kPrimaryText,
  );

  Icon showIcon() {
    if (obsecure) {
      return invisible;
    } else {
      return visible;
    }
  }

  // bool visibility(obscureText) {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getWidth(5), vertical: getHeight(5)),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        maxLines: widget.maxLines ?? 1,
        obscureText: obsecure,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        cursorColor: kSecondaryText,
        style: kStyleParagraph,
        // style: TextStyle(
        //   fontSize: widget.fontSize,
        //   color: kPrimaryText,
        //   height: getHeight(1),
        // ),
        controller: widget.textEditingController,
        decoration: InputDecoration(
          suffixText: widget.suffixText,
          suffixStyle: const TextStyle(color: kSecondaryText),
          prefixText: widget.prefixText,
          prefixStyle: const TextStyle(color: kSecondaryText),
          suffixIcon: widget.isSuffix
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      if (widget.obsecure == true) {
                        obsecure = !obsecure;
                      } else {
                        widget.textEditingController.clear();
                      }
                    });
                  },
                  icon: (widget.obsecure == true)
                      ? showIcon()
                      : Icon(
                          widget.icon,
                          size: getWidth(25),
                          color: kSecondaryText,
                        ),
                )
              : null,
          filled: true,
          fillColor: widget.color,
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: kSecondaryText,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

// Show snack bar
showButtonsnack(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(text)));
}

class ScrollDownBar extends StatelessWidget {
  const ScrollDownBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 5,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kSecondaryText,
          ),
        ),
      ),
    );
  }
}
// Post Card

class PostCard extends StatelessWidget {
  final VoidCallback onTap;
  final String time;
  final String posterImg;
  final String profilePic;
  final String postTitle;
  final bool isOnline;
  final bool isEvent;
  final String date;
  final String month;
  const PostCard({
    Key? key,
    required this.date,
    required this.month,
    required this.isOnline,
    required this.isEvent,
    required this.postTitle,
    required this.profilePic,
    required this.posterImg,
    required this.time,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHalfVertical,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: getHeight(220),
          decoration: BoxDecoration(
            color: kPrimaryLight,
            borderRadius: kHalfCurve,
          ),
          child: Column(
            children: [
              SizedBox(
                height: getHeight(10),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: kHalfHorizontal,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: kSecondaryText,
                          borderRadius: kQuatCurve,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(posterImg),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: kHalfPad,
                          child: Container(
                            width: getWidth(30),
                            height: getHeight(40),
                            decoration: BoxDecoration(
                              color: kPrimaryText,
                              borderRadius: kQuatCurve,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  month,
                                  style: kCalenderText,
                                ),
                                SizedBox(
                                  height: getHeight(3),
                                ),
                                Text(
                                  date,
                                  style: kCalenderText,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Padding(
                      padding: kHalfHorizontal,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profilePic),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          postTitle,
                          style: kStyleSecondaryHeading,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(isEvent ? "assets/icons/icon_map.svg" : "assets/icons/icon_graduation.svg"),
                            SizedBox(
                              width: getWidth(10),
                            ),
                            Text(
                              isOnline ? "Online " : "Offline ",
                              style: kStyleSecondaryPara,
                            ),
                            Text(
                              isEvent ? "Event" : "Contest",
                              style: kStyleSecondaryPara,
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: kHalfHorizontal,
                      child: Container(
                        width: getWidth(80),
                        decoration: BoxDecoration(
                          color: kPrimaryDark,
                          borderRadius: kQuatCurve,
                        ),
                        child: Center(
                            child: Text(
                          time,
                          style: kStylePrimaryPara,
                        )),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getHeight(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Option Card

class OptionCard extends StatefulWidget {
  final String svgPath;
  final bool isSelect;
  final VoidCallback? onTap;
  final String title;
  final String description;
  const OptionCard({
    Key? key,
    required this.svgPath,
    required this.isSelect,
    required this.title,
    required this.description,
    this.onTap,
  }) : super(key: key);

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: kSingleCurve,
          border: Border.all(width: getHeight(2), color: kPrimaryLight),
          color: widget.isSelect ? kPrimaryLight : kPrimaryDark,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: CircleAvatar(
                  child: SvgPicture.asset(
                    widget.svgPath,
                    height: getHeight(80),
                  ),
                  backgroundColor: kPrimaryLight,
                  radius: getHeight(30),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(right: getWidth(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: kStyleSecondaryBold,
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Text(
                      widget.description,
                      style: kStylePrimaryPara,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
