import 'package:flutter/material.dart';

class AppStatusColors extends ThemeExtension<AppStatusColors> {
  final Color done;
  final Color undone;
  final Color remove;
  final Color onButton;
  final Color border;
  final Color textDisabledColor;

  AppStatusColors({
    required this.done,
    required this.undone,
    required this.remove,
    required this.onButton,
    required this.border,
    required this.textDisabledColor,
  });

  @override
  AppStatusColors copyWith({
    Color? done,
    Color? undone,
    Color? remove,
    Color? onButton,
    Color? border,
    Color? textDisabledColor,
  }) {
    return AppStatusColors(
      done: done ?? this.done,
      undone: undone ?? this.undone,
      remove: remove ?? this.remove,
      onButton: onButton ?? this.onButton,
      border: border ?? this.border,
      textDisabledColor:
          textDisabledColor ?? this.textDisabledColor,
    );
  }

  @override
  AppStatusColors lerp(
    ThemeExtension<AppStatusColors>? other,
    double t,
  ) {
    if (other is! AppStatusColors) return this;
    return AppStatusColors(
      done: Color.lerp(done, other.done, t)!,
      undone: Color.lerp(undone, other.undone, t)!,
      remove: Color.lerp(remove, other.remove, t)!,
      onButton: Color.lerp(onButton, other.onButton, t)!,
      border: Color.lerp(border, other.border, t)!,
      textDisabledColor: Color.lerp(
        textDisabledColor,
        other.textDisabledColor,
        t,
      )!,
    );
  }
}
