import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color bgColor = Color(0xff202020);

  static const Color primaryColor = Color(0xff626ED9);
  static const Color surfaceLightColor = Color(0xff2c2c2c);
  static const Color borderColor = Color(0xff373737);

  static const Color doneColor = Color(0xffECBB5B);
  static Color get undoneColor =>
      doneColor.withValues(alpha: 0.5);
  static const Color removeColor = Color(0xffC64444);
  static const Color onButtonColor = Color(0xff2c2c2c);

  static const Color textPrimaryColor = Color(0xffBABABA);
  static Color get textDisabledColor =>
      textPrimaryColor.withValues(alpha: 0.5);
}
