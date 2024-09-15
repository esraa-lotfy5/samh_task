import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final double? width;
  final double height;
  final double prefixHorizontalPadding;
  final String? suffixText;
  final bool enabled;
  final bool obscureText;
  final bool addHintVerticalPadding;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Color? color; // input text color
  final Color borderColor;
  final Color underlineColor;
  final double borderRadius;
  final int maxLines;
  final FocusNode? focusNode;
  final int errorMaxLines;
  final bool withFocusedBorder;
  final bool isFocus;
  final TextInputAction doneButton;
  final Function()? onChange;
  final Function(String)? onFieldSubmitted;
  final dynamic Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.controller,
    this.backgroundColor = AppColors.white,
    required this.title,
    this.suffix,
    this.suffixText,
    this.prefix,
    this.onChange,
    this.onFieldSubmitted,
    this.enabled = true,
    this.obscureText = false,
    this.addHintVerticalPadding = false,
    this.prefixHorizontalPadding = 14.0,
    this.keyboardType,
    this.width,
    this.height = 48.0,
    this.underlineColor = AppColors.grayishRedOpacity38,
    this.color = AppColors.primary,
    this.maxLines = 1,
    this.focusNode,
    this.validator,
    this.borderColor = AppColors.grayishRedOpacity38,
    this.borderRadius = 10.0,
    this.errorMaxLines = 2,
    this.withFocusedBorder = true,
    this.isFocus = false,
    this.doneButton = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          /// Add margin to handle label position as design
          margin: const EdgeInsetsDirectional.only(top: 8.0),
          width: width ?? MediaQuery.of(context).size.width,
          height: height,
          child: TextFormField(
            cursorColor: AppColors.grayishRedOpacity38,
            autofocus: isFocus,
            focusNode: focusNode,
            maxLines: maxLines,
            controller: controller,
            enabled: enabled,
            obscureText: obscureText,
            keyboardType: keyboardType ?? TextInputType.text,
            style: TextStyleManager.semiBold(color: color, size: 16),
            autocorrect: false,
            decoration: InputDecoration(
              errorMaxLines: errorMaxLines,
              errorStyle: const TextStyle(color: Colors.red),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: underlineColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: underlineColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: underlineColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              suffix: suffix,
              suffixText: suffixText,
              suffixStyle: TextStyleManager.medium(size: 12.0, color: AppColors.veryDarkVioletOpacity35),
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: prefixHorizontalPadding),
                child: prefix,
              ),
              prefixIconConstraints: const BoxConstraints(maxWidth: 130),
            ),
            onChanged: (val) {
              if (onChange != null) onChange!();
              log("onFieldSubmitted $val");
            },
            validator: (val) => validator != null ? validator!(val) : null,
            textInputAction: doneButton,
          ),
        ),

        /// Label
        PositionedDirectional(
          start: 30.0,
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 4.0),
            color: AppColors.white,
            child: Text(
              title,
              style: TextStyleManager.medium(size: 12.0, color: AppColors.grayishRed),
            ),
          ),
        ),
      ],
    );
  }
}
