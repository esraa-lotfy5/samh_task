import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_images.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/screens/home/home_view_model.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_image.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_text_form_field.dart';

class FromToWidget extends ConsumerStatefulWidget {
  const FromToWidget({super.key});

  @override
  ConsumerState createState() => _FromToWidgetState();
}

class _FromToWidgetState extends ConsumerState<FromToWidget> {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Consumer(
              builder: (context, ref, child) {
                final text = ref.watch(HomeViewModel.fromBookingProvider) ?? "";
                return CustomTextFormField(
                  controller: _fromController,
                  title: LocaleKeys.from.tr(),
                  suffixText: text.isNotEmpty
                      ? "(${text.substring(0, text.length < 3 ? text.length : 3).toUpperCase()})"
                      : null,
                  onChange: () {
                    ref.read(HomeViewModel.fromBookingProvider.notifier).state = _fromController.text.trim();
                  },
                  prefix: const Icon(Icons.circle, size: 8.0, color: AppColors.primary),
                );
              },
            ),
            const SizedBox(height: 22.0),
            Consumer(
              builder: (context, ref, child) {
                final text = ref.watch(HomeViewModel.toBookingProvider) ?? "";
                return CustomTextFormField(
                  controller: _toController,
                  title: LocaleKeys.to.tr(),
                  prefixHorizontalPadding: 12.0,
                  suffixText: text.isNotEmpty
                      ? "(${text.trim().substring(0, text.length < 3 ? text.length : 3).toUpperCase()})"
                      : null,
                  prefix: CustomImage.svg(src: AppSvg.icPlan, height: 14.0, width: 15.0),
                  onChange: () {
                    ref.read(HomeViewModel.toBookingProvider.notifier).state = _toController.text.trim();
                  },
                );
              },
            ),
          ],
        ),
        PositionedDirectional(
          top: 50,
          start: MediaQuery.of(context).size.width / 3,
          child: CustomImage.svg(src: AppSvg.icConverter),
        ),
        const PositionedDirectional(
          top: 40,
          start: 18,
          child: Dash(direction: Axis.vertical, length: 60, dashLength: 5, dashColor: AppColors.secondary),
        ),
      ],
    );
  }
}
