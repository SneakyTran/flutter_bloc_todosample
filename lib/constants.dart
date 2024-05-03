// Screen ratio layout scale
import 'package:flutter/material.dart';

const kScreenHeightRatio = 825;
const kScreenWidthRatio = 408;

//LetStartScreen ratio
//layout scale
const kLetStartScreenTopRateScale = 482;
const kLetStartScreenBottomRateScale =
    kScreenHeightRatio - kLetStartScreenTopRateScale;

//Top layout LetStartScreen
//Horizontal ratio scale
const kBackgroundLeftRatio = 202;
const kBackgroundRightRatio = kScreenWidthRatio - kBackgroundLeftRatio;

//background shape color
const kColorYellow = Color(0xFFEDF046);
const kColorGreen = Color(0xFF46F080);
const kColorLightGreen = Color(0xFF7FFCAA);
const kColorPurple = Color(0xFFBE9FFF);
const kColorPurple2 = Color(0xFF9f85ed);
const kColorDarkBlue = Color(0xFF2555FF);
const kColorLightBlue = Color(0xFF46BDF0);
const kColorSecondaryLightBlue = Color(0xFFA4E7F9);
const kColorBlue = Color(0xFF92DEFF);
const kColorPink = Color(0xFFFFD7E4);
const kColorSecondaryYellow = Color(0xFFEAED2A);
const kColorOrange = Color(0xFFF0B646);

const kColorButton = Color(0xFF5F33E1);
const kColorMenu = Color(0xFF5f33e1);
const kColorButtonInactive = Color(0xFFede8ff);

const kColorIconPink = Color(0xFFf478b8);
const kColorIconPurple = Color(0xFF9260F4);
const kColorIconOrange = Color(0xFFff9142);

//shape radian
const double kRadianNormal = 70.0;
const double kRadianLarge = 118.0;
const double kRadianExtraSmall = 4;
const double kRadianSmall = 8;

//text style buttons
const kTextButtonStyle = TextStyle(
  color: Colors.white,
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

//text style
const kTextTitle = TextStyle(
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const kTextContent = TextStyle(
  color: Colors.black,
  fontSize: 16,
);
//icon
// const kIconStyle  =

//card

const kTextTitleSimpleCard = TextStyle(
  color: Color(0xFF6E6A7C),
  fontSize: 14,
);

const kTextLightColorCard = TextStyle(
  color: Color(0xFF6E6A7C),
  fontSize: 9,
);

const kTextDescriptionSimpleCard = TextStyle(
  color: Color(0xFF24252C),
  fontSize: 18,
  fontWeight: FontWeight.w400,
);

const kTextStyleTitleHome = TextStyle(
  fontSize: 24,
  color: Colors.black,
  fontWeight: FontWeight.w700,
);
//Logo style
const kTitleLogoCard = TextStyle(
  color: Color(0xFF047C78),
  fontStyle: FontStyle.italic,
  fontSize: 17,
);

const kDescriptionLogoCard = TextStyle(
  color: Color(0xFFF2582C),
  fontStyle: FontStyle.italic,
  fontSize: 17,
);

const kCardBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(16),
  ),
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      blurRadius: 32,
      spreadRadius: 0,
      offset: Offset(0, 4),
    ),
  ],
);

const kButtonBoxShadow = BoxShadow(
  color: Color.fromRGBO(190, 159, 255, 0.8),
  spreadRadius: 2,
  blurRadius: 10,
  offset: Offset(0, 10),
);

//REFACTOR CODE
const kColorTitle = Color(0xFF6E6A7C);
const kColorContent = Color(0xFF24252C);
const kTitleTextStyle = TextStyle(
  fontSize: 14,
  color: kColorTitle,
  fontWeight: FontWeight.w400,
);
const kContentTextStyle = TextStyle(
  fontSize: 18,
  color: kColorContent,
  fontWeight: FontWeight.w400,
);
const kCardColorBlue = Color(0xFFe7f3ff);
const kLinearProgressDecoration =
    BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)));
const kColorLinearProgress = Color(0xFF0087ff);
const kInputDecoration = InputDecoration(
  prefixStyle: TextStyle(color: Colors.black),
  hintStyle: TextStyle(color: Colors.black38),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorButton, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorButton, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
