import 'package:flutter/material.dart';

// SizedBox Spacer
abstract class Constants {
  //Horizontal Spacer
  static SizedBox veryTinyHorizontalSpacer = const SizedBox(width: 2);
  static SizedBox tinyHorizontalSpacer = const SizedBox(width: 4);
  static SizedBox smallHorizontalSpacer = const SizedBox(width: 8);
  static SizedBox mediumHorizontalSpacer = const SizedBox(width: 16);
  static SizedBox largeHorizontalSpacer = const SizedBox(width: 24);
  static SizedBox xLargeHorizontalSpacer = const SizedBox(width: 32);
  static SizedBox xxLargeHorizontalSpacer = const SizedBox(width: 40);

  //Vertical Spacer
  static SizedBox veryTinyVerticalSpacer = const SizedBox(height: 2);
  static SizedBox tinyVerticalSpacer = const SizedBox(height: 4);
  static SizedBox smallVerticalSpacer = const SizedBox(height: 8);
  static SizedBox mediumVerticalSpacer = const SizedBox(height: 16);
  static SizedBox largeVerticalSpacer = const SizedBox(height: 24);
  static SizedBox xLargeVerticalSpacer = const SizedBox(height: 32);
  static SizedBox xxLargeVerticalSpacer = const SizedBox(height: 40);
}

// SharedPreferencesKeys

const String factorHomeListSharedPreferencesKey = 'factorHomeList';
const String unofficialFactorSharedPreferencesKey = 'unofficialFactorList';

// Icons
const String ZirehIcon = 'assets/images/ziro_icon.png';

Color pinkColor = const Color(0xffd14471);
Color backGroundColor = const Color(0xfff5f8fe);
Color dimGrayColor = const Color(0xff5d5d5e);
Color grayColor = const Color(0xff808080);
Color oldLaceColor = const Color(0xfffff9e7);
Color khakiColor = const Color(0xffffd868);
Color borderLavenderColor = const Color(0xffe5e9f0);
Color lightGrayColor = const Color(0xffcdced2);
Color crimsonColor = const Color(0xffc30e48);
