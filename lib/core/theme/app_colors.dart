import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Dark mode ──
  static const Color bgColor = Color(0xff202020);
  static const Color surfaceLightColor = Color(0xff2c2c2c);
  static const Color borderColor = Color(0xff373737);
  static const Color textPrimaryColor = Color(0xffBABABA);

  // ── Light mode (generated — no Figma spec, derived to match brand) ──
  static const Color bgColorLight = Color(0xffF7F7F7);
  static const Color surfaceLightColorLight = Color(0xffFFFFFF);
  static const Color borderColorLight = Color(0xffE0E0E0);
  static const Color textPrimaryColorLight = Color(0xff2B2B2B);

  // ── Brand/status colors — shared across both themes ──
  static const Color primaryColor = Color(0xff626ED9);
  static const Color doneColor = Color(0xffECBB5B);
  static Color get undoneColor =>
      doneColor.withValues(alpha: 0.5);
  static const Color removeColor = Color(0xffC64444);
  static const Color onButtonColor = Color(0xff2c2c2c);
}
