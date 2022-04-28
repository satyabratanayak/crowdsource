import 'package:crowdsource/Utilities/size_config.dart';
import 'package:flutter/material.dart';

//
//
//
// Primary Colour Constants
const Color kPrimaryLight = Color(0xFF252a34);
const Color kPrimaryDark = Color(0xFF171920);

// All Text Colour constants
const Color kPrimaryText = Color(0xffffffff);
const Color kSecondaryText = Color(0xff636e83);

// Special Colour constants
const Color kEventIndicator = Color(0xff7eb9ff);
const Color kContestIndicator = Color(0xffef9226);

//
//
//
//
// Bold Text Style
TextStyle kStylePrimaryBold = TextStyle(
  color: kPrimaryText,
  fontSize: getWidth(22),
  fontWeight: FontWeight.w800,
);
TextStyle kStyleSecondaryBold = TextStyle(
  color: kPrimaryText,
  fontSize: getHeight(22),
  fontWeight: FontWeight.w900,
);
TextStyle kStylePrimaryHeading = TextStyle(
  color: kPrimaryText,
  fontSize: getWidth(15),
  fontWeight: FontWeight.w800,
);
TextStyle kStyleSecondaryHeading = TextStyle(
  color: kPrimaryText,
  fontSize: getWidth(13),
  fontWeight: FontWeight.w800,
);

// Pararaph Text Style
TextStyle kStylePrimaryPara = TextStyle(
  color: kSecondaryText,
  fontSize: getHeight(11),
  fontWeight: FontWeight.w900,
);
TextStyle kStyleSecondaryPara = TextStyle(
  color: kSecondaryText,
  fontSize: getHeight(10),
  fontWeight: FontWeight.w900,
);
TextStyle kStyleParagraph = TextStyle(
  color: kSecondaryText,
  fontSize: getHeight(12),
  fontWeight: FontWeight.w500,
);
TextStyle kStyleParagraphSmall = TextStyle(
  color: kSecondaryText,
  fontSize: getHeight(10),
  fontWeight: FontWeight.w500,
);
TextStyle kCalenderText = TextStyle(
  color: kPrimaryDark,
  fontSize: getHeight(10),
  fontWeight: FontWeight.w900,
);

// Button Text Style
TextStyle kStylePrimaryButton = TextStyle(
  color: kPrimaryDark,
  fontSize: getHeight(16),
  fontWeight: FontWeight.w800,
);
TextStyle kStylePrimaryButtonLight = TextStyle(
  color: kSecondaryText,
  fontSize: getHeight(16),
  fontWeight: FontWeight.w900,
);
TextStyle kStyleSecondaryButton = TextStyle(
  color: kPrimaryText,
  fontSize: getHeight(20),
  fontWeight: FontWeight.w900,
);

// Special Text Style
TextStyle kStyleEventText = TextStyle(
  color: kEventIndicator,
  fontSize: getHeight(18),
  fontWeight: FontWeight.w900,
);
TextStyle kStyleContestText = TextStyle(
  color: kContestIndicator,
  fontSize: getHeight(18),
  fontWeight: FontWeight.w900,
);

//
//
//
// EdgeInsets.all Padding Constants on this Project
EdgeInsetsGeometry kQuatPad = EdgeInsets.all(getWidth(5));
EdgeInsetsGeometry kHalfPad = EdgeInsets.all(getWidth(10));
EdgeInsetsGeometry kFullPad = EdgeInsets.all(getWidth(20));
EdgeInsetsGeometry kSinglePad = EdgeInsets.all(getWidth(30));
EdgeInsetsGeometry kDoublePad = EdgeInsets.all(getWidth(40));

// EdgeInsets.Symmetric - Horizontal Padding Constants on this Project
EdgeInsetsGeometry kQuatHorizontal = EdgeInsets.symmetric(horizontal: getWidth(5));
EdgeInsetsGeometry kHalfHorizontal = EdgeInsets.symmetric(horizontal: getWidth(10));
EdgeInsetsGeometry kFullHorizontal = EdgeInsets.symmetric(horizontal: getWidth(20));
EdgeInsetsGeometry kSingleHorizontal = EdgeInsets.symmetric(horizontal: getWidth(30));
EdgeInsetsGeometry kDoubleHorizontal = EdgeInsets.symmetric(horizontal: getWidth(40));

// EdgeInsets.Symmetric - Vertical Padding Constants on this Project
EdgeInsetsGeometry kQuatVertical = EdgeInsets.symmetric(vertical: getWidth(5));
EdgeInsetsGeometry kHalfVertical = EdgeInsets.symmetric(vertical: getWidth(10));
EdgeInsetsGeometry kSingleVertical = EdgeInsets.symmetric(vertical: getWidth(20));
EdgeInsetsGeometry kDoubleVertical = EdgeInsets.symmetric(vertical: getWidth(40));

// Radius Constant For container
BorderRadiusGeometry kQuatCurve = BorderRadius.circular(getWidth(5));
BorderRadiusGeometry kHalfCurve = BorderRadius.circular(getWidth(10));
BorderRadiusGeometry kFullCurve = BorderRadius.circular(getWidth(20));
BorderRadiusGeometry kSingleCurve = BorderRadius.circular(getWidth(30));
BorderRadiusGeometry kDoubleCurve = BorderRadius.circular(getWidth(40));
