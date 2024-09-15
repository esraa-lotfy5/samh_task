import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/enums/image_type.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_progress_indicator.dart';

class CustomImage extends StatelessWidget {
  final ImageType imageType;
  final String? src;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final bool? isMatchingTextDirection;
  final double? radius;
  final String? errorPlaceholder;
  final double? errorPlaceholderWidth;
  final double? errorPlaceholderHeight;
  final BoxFit? errorPlaceholderFit;
  final double? errorIconSize;

  const CustomImage.asset({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.color,
    this.isMatchingTextDirection,
    this.fit = BoxFit.cover,
  })  : imageType = ImageType.png,
        radius = null,
        errorPlaceholder = null,
        errorPlaceholderWidth = null,
        errorPlaceholderHeight = null,
        errorPlaceholderFit = null,
        errorIconSize = null;

  const CustomImage.svg({
    super.key,
    required this.src,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.isMatchingTextDirection = true,
  })  : imageType = ImageType.svg,
        radius = null,
        errorPlaceholder = null,
        errorPlaceholderWidth = null,
        errorPlaceholderHeight = null,
        errorPlaceholderFit = null,
        errorIconSize = null;

  const CustomImage.network({
    super.key,
    this.src,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius = 0,
    this.errorPlaceholder,
    this.errorPlaceholderWidth,
    this.errorPlaceholderHeight,
    this.errorPlaceholderFit = BoxFit.contain,
    this.errorIconSize = 100,
  })  : imageType = ImageType.network,
        color = null,
        isMatchingTextDirection = null;

  @override
  Widget build(BuildContext context) {
    switch (imageType) {
      case ImageType.png:
        return Image.asset(
          src!,
          width: width,
          height: height,
          color: color,
          fit: fit,
        );
      case ImageType.svg:
        return SvgPicture.asset(
          src!,
          width: width,
          height: height,
          fit: fit,
          colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
          matchTextDirection: isMatchingTextDirection!,
        );
      default:
        var child = Image.network(
          src ?? '',
          width: width,
          height: height,
          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CustomProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) => errorPlaceholder != null
              ? SvgPicture.asset(
                  errorPlaceholder!,
                  width: errorPlaceholderWidth ?? width,
                  height: errorPlaceholderHeight ?? height,
                  fit: errorPlaceholderFit!,
                )
              : Icon(Icons.image_not_supported, color: AppColors.primary, size: errorIconSize),
        );
        return ClipRRect(
          borderRadius: BorderRadius.circular(radius!),
          child: child,
        );
    }
  }
}
