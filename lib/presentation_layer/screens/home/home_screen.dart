import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_constants.dart';
import 'package:samh_task/core/enums/background_image.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/screens/home/home_view_model.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_background_header.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_tab_bar.dart';
import 'package:samh_task/presentation_layer/widgets/home/booking_form.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: CustomBackgroundHeader(
            height: 294.0,
            image: BackgroundImage.bookFlight,
            showLogo: true,
          ),
        ),
        Positioned.fill(
          top: AppConstants.kNotchHeight + 110.0,
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            body: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Book Your Flight text
                  Text(
                    LocaleKeys.bookYourFlight.tr(),
                    style: TextStyleManager.bold(fontSize: 34.0, color: AppColors.white),
                  ),

                  /// Tabs
                  CustomTabBar(
                    tabs: [
                      Tab(text: LocaleKeys.roundTrip.tr()),
                      Tab(text: LocaleKeys.oneWay.tr()),
                      Tab(text: LocaleKeys.multiCity.tr())
                    ],
                    onTap: _updateTabsIndex,
                  ),
                  const SizedBox(height: 10.0),
                  const Expanded(
                    child: SingleChildScrollView(
                      child: BookingForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _updateTabsIndex(int index) => ref.read(HomeViewModel.tabsIndexProvider.notifier).state = index;
}
