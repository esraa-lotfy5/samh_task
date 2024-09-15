import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_constants.dart';
import 'package:samh_task/core/constants/app_images.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';
import 'package:samh_task/core/utils/localization_util.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/screens/flight/flight_screen.dart';
import 'package:samh_task/presentation_layer/screens/home/home_screen.dart';
import 'package:samh_task/presentation_layer/screens/tabs/tabs_view_model.dart';
import 'package:samh_task/presentation_layer/screens/search/search_screen.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_drop_down_menu.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_image.dart';

class TabsScreen extends ConsumerWidget {
  TabsScreen({super.key});

  final _children = [
    const HomeScreen(),
    const FlightScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(TabsViewModel.bottomTabsIndex);

    return Scaffold(
      body: _children[selectedIndex],
      drawer: Drawer(
        backgroundColor: AppColors.white,
        clipBehavior: Clip.hardEdge,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 80.0),
            Container(
              height: 50,
              padding: const EdgeInsetsDirectional.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomImage.svg(
                src: AppSvg.icLogo,
                isMatchingTextDirection: false,
                // height: 30,
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomDropDownMenu(
                items: const [AppConstants.arLangCode, AppConstants.enLangCode],
                labelText: LocaleKeys.language.tr(),
                onChange: (value) => _changeLanguage(context: context, ref: ref, langCode: value),
                selectedValue: LocalizationUtil.getLanguage(),
                isExpanded: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: InkWell(
        onTap: () => _onBottomNavigationBarTapped(ref, 1),
        child: Container(
          padding: const EdgeInsetsDirectional.all(12),
          height: 60,
          width: 60,
          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
          child: CustomImage.svg(src: AppSvg.icFlight, isMatchingTextDirection: false),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65.0,
        notchMargin: 8.0,
        color: AppColors.primary,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () => _onBottomNavigationBarTapped(ref, 0),
              child: SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: CustomImage.svg(
                        src: AppSvg.icHome,
                        height: 20,
                        isMatchingTextDirection: false,
                      ),
                    ),
                    Text(
                      LocaleKeys.home.tr(),
                      style: TextStyleManager.regular(size: 12.0, color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 60),
            InkWell(
              onTap: () => _onBottomNavigationBarTapped(ref, 2),
              child: SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: CustomImage.svg(
                        src: AppSvg.icSearch,
                        height: 20,
                        isMatchingTextDirection: false,
                      ),
                    ),
                    Text(
                      LocaleKeys.search.tr(),
                      style: TextStyleManager.regular(size: 12.0, color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBottomNavigationBarTapped(WidgetRef ref, int index) {
    ref.read(TabsViewModel.bottomTabsIndex.notifier).state = index;
  }

  void _changeLanguage({required WidgetRef ref, required BuildContext context, required String langCode}) {
    context.setLocale(
      Locale(
        langCode,
        langCode == AppConstants.arLangCode ? AppConstants.arCountryCode : AppConstants.enCountryCode,
      ),
    );
    LocalizationUtil.setLanguageCode(ref, langCode);
  }
}
