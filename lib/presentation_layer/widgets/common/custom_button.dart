import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? titleColor;
  final double titleSize;
  final Function onPressed;
  final double borderRadius;
  final double? width;
  final double height;
  final TextStyle? textStyle;
  final double? borderWidth;
  final bool isActive;

  const CustomButton({
    super.key,
    required this.title,
    this.titleColor = AppColors.white,
    this.backgroundColor = AppColors.secondary,
    this.titleSize = 14.0,
    required this.onPressed,
    this.borderRadius = 15,
    this.width,
    this.height = 50,
    this.textStyle,
    this.borderColor,
    this.borderWidth,
    this.isActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      padding: const EdgeInsets.all(0.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: borderColor ?? AppColors.transparent,
              width: borderWidth ?? 1,
            ),
          ),
        ),
        onPressed: () => isActive ? onPressed() : {},
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: textStyle ?? TextStyleManager.bold(color: titleColor, size: titleSize),
          maxLines: 1,
        ),
      ),
    );
  }
}
