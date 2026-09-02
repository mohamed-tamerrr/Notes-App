import 'package:flutter/material.dart';
import 'package:p/core/theme/app_colors.dart';
import 'package:p/core/theme/app_status_colors.dart';
import 'package:p/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.bgColor,

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: AppTextStyles.inputText,

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),

    textTheme: const TextTheme(
      labelLarge: AppTextStyles.inputButtonText,
    ),
    fontFamily: 'Rubik',
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,

      primary: AppColors.primaryColor,
      onPrimary: AppColors.onButtonColor,
      surface: AppColors.surfaceLightColor,
      onSurface: AppColors.textPrimaryColor,
      error: AppColors.removeColor,
      onError: AppColors.onButtonColor,
    ),

    extensions: <ThemeExtension<dynamic>>[
      AppStatusColors(
        done: AppColors.doneColor,
        undone: AppColors.undoneColor,
        remove: AppColors.removeColor,
        onButton: AppColors.onButtonColor,
        border: AppColors.borderColor,
        textDisabledColor: AppColors.textDisabledColor,
      ),
    ],
  );
}
