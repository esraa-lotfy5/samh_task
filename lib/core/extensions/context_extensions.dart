import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';

extension ContextExtensions on BuildContext {
  void showNativeSnackBar({required String text, bool shouldClearSnackBars = true}) {
    if (shouldClearSnackBars) ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(text, style: TextStyleManager.regular()),
        backgroundColor: AppColors.whiteOpacity5,
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
