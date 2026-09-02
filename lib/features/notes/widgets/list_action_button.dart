import 'package:flutter/material.dart';
import 'package:p/core/theme/app_text_styles.dart';

class ListActionButton extends StatelessWidget {
  const ListActionButton({
    super.key,
    required this.backgroundColor,
    required this.label,
    required this.onPressed,
  });

  final Color backgroundColor;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        textStyle: AppTextStyles.listButtonText,
        backgroundColor: backgroundColor,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(label),
    );
  }
}
