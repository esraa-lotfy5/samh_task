import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_constants.dart';
import 'package:samh_task/core/constants/app_globals.dart';
import 'package:samh_task/core/constants/app_images.dart';
import 'package:samh_task/core/enums/background_image.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_image.dart';

class CustomBackgroundHeader extends StatelessWidget {
  const CustomBackgroundHeader({
    super.key,
    required this.height,
    required this.image,
    this.showLogo = false,
    this.title,
  });

  final double height;
  final BackgroundImage image;
  final bool showLogo;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height + AppConstants.kNotchHeight,
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(25.0)),
        ),
        PositionedDirectional(
          top: AppConstants.kNotchHeight,
          start: 36.0,
          child: CustomImage.svg(src: AppSvg.worldMap, isMatchingTextDirection: false),
        ),
        PositionedDirectional(
          top: 36.0 + AppConstants.kNotchHeight,
          end: 61.0,
          child: CustomImage.asset(src: image.imagePath, isMatchingTextDirection: false),
        ),
        if (showLogo)
          PositionedDirectional(
            top: 25.0 + AppConstants.kNotchHeight,
            start: (MediaQuery.of(context).size.width - 117.0) / 2, // 117.0 is logo width
            child: CustomImage.svg(src: AppSvg.icLogo, isMatchingTextDirection: false),
          )
        else ...[
          PositionedDirectional(
            top: 10.0 + AppConstants.kNotchHeight,
            start: 14.0,
            child: IconButton(
              onPressed: () => AppGlobals.navigatorKey.currentState?.pop(),
              icon: Icon(
                  context.locale.countryCode == AppConstants.arCountryCode ? Icons.arrow_forward : Icons.arrow_back,
                  color: AppColors.white),
            ),
          ),
          PositionedDirectional(
            top: 25.0 + AppConstants.kNotchHeight,
            start: (MediaQuery.of(context).size.width - 117.0) / 2, // 117.0 is logo width
            child: Text(
              title ?? "",
              style: TextStyleManager.bold(color: AppColors.white, size: 16.0),
            ),
          ),
        ],
      ],
    );
  }
}
