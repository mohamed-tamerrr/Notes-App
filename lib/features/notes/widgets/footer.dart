import 'package:flutter/material.dart';
import 'package:p/core/theme/app_text_styles.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Developed By Me @ 2026',
      style: AppTextStyles.footerText,
    );
  }
}
