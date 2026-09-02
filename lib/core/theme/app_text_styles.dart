import 'package:flutter/material.dart';
import 'package:p/core/theme/app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static const TextStyle heading = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryColor,
  );
  static const TextStyle inputText = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );
  static const TextStyle inputButtonText = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.onButtonColor,
  );
  static const TextStyle listText = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimaryColor,
  );

  static const TextStyle listButtonText = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.onButtonColor,
  );

  static const TextStyle footerText = TextStyle(
    fontFamily: 'Rubik',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
