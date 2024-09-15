import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_fonts.dart';

class TextStyleManager {
  TextStyleManager._();

  static TextStyle _base({
    required FontWeight fontWeight,
    double? size,
    Color? color,
    TextDecoration? textDecoration,
    double? height,
  }) =>
      TextStyle(
        fontFamily: AppFonts.fontFamily,
        fontWeight: fontWeight,
        fontSize: size ?? 14,
        decoration: textDecoration ?? TextDecoration.none,
        color: color ?? AppColors.primary,
        height: height ?? 1.2,
      );

  static TextStyle light({double? size, Color? color, TextDecoration? textDecoration}) =>
      _base(fontWeight: FontWeight.w300, size: size, color: color, textDecoration: textDecoration);

  static TextStyle regular({double? size, Color? color, TextDecoration? textDecoration, double? height}) =>
      _base(fontWeight: FontWeight.w400, size: size, color: color, textDecoration: textDecoration, height: height);

  static TextStyle medium({double? size, Color? color, TextDecoration? textDecoration}) =>
      _base(fontWeight: FontWeight.w500, size: size, color: color, textDecoration: textDecoration);

  static TextStyle semiBold({double? size, Color? color, TextDecoration? textDecoration}) =>
      _base(fontWeight: FontWeight.w600, size: size, color: color, textDecoration: textDecoration);

  static TextStyle bold({double? size, Color? color, TextDecoration? textDecoration}) =>
      _base(fontWeight: FontWeight.w700, size: size, color: color, textDecoration: textDecoration);

  static TextStyle extraBold({double? size, Color? color, TextDecoration? textDecoration}) =>
      _base(fontWeight: FontWeight.w800, size: size, color: color, textDecoration: textDecoration);

  static TextStyle black({double? size, Color? color, TextDecoration? textDecoration}) =>
      _base(fontWeight: FontWeight.w900, size: size, color: color, textDecoration: textDecoration);
}
