import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_fonts.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';

class ThemeManager {
  ThemeManager._();

  static ThemeData getThemeData() => ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColors.primary),
        fontFamily: AppFonts.fontFamily,
        scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
        appBarTheme: _getAppBarTheme(),
        iconTheme: const IconThemeData(color: AppColors.white),

        /// In Material 3, If local text style is not set, Flutter uses bodyLarge
        /// style as a default for the input style.
        textTheme: TextTheme(bodyLarge: TextStyleManager.regular()),
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColors.lightGrey,
          selectionHandleColor: AppColors.white,
          cursorColor: AppColors.secondary,
        ),
        chipTheme: _getChipThemeData(),
      );

  static AppBarTheme _getAppBarTheme() => ThemeData.light().appBarTheme.copyWith(
        foregroundColor: AppColors.primary,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyleManager.medium(),
      );

  static ChipThemeData _getChipThemeData() => ChipThemeData(
        backgroundColor: AppColors.primary,
        selectedColor: AppColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
        showCheckmark: false,
        labelStyle: TextStyleManager.medium(fontSize: 11, color: AppColors.white),
      );
}
