import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_constants.dart';
import 'package:samh_task/core/enums/background_image.dart';
import 'package:samh_task/core/enums/flight_type.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/screens/home/home_view_model.dart';
import 'package:samh_task/presentation_layer/screens/search_results/search_results_view_model.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_background_header.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_progress_indicator.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_scaffold.dart';
import 'package:samh_task/presentation_layer/widgets/search_results/search_result_card.dart';

class SearchResultsScreen extends ConsumerStatefulWidget {
  const SearchResultsScreen({super.key});

  @override
  ConsumerState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends ConsumerState<SearchResultsScreen> {
  late final fromCity = ref.read(HomeViewModel.fromBookingProvider)!;
  late final toCity = ref.read(HomeViewModel.toBookingProvider)!;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => ref.read(SearchResultsViewModel.searchListProvider.notifier).getFlights(
              fromCity: ref.read(HomeViewModel.fromBookingProvider)!,
              toCity: ref.read(HomeViewModel.toBookingProvider)!,
              date: ref.read(HomeViewModel.dateBookingProvider)!,
              travellers: ref.read(HomeViewModel.passengerNumberBookingProvider),
              flightClassType: ref.read(HomeViewModel.classBookingProvider)!,
              flightType: ref.read(HomeViewModel.tabsIndexProvider) == 0
                  ? FlightType.roundTrip
                  : ref.read(HomeViewModel.tabsIndexProvider) == 1
                      ? FlightType.oneWay
                      : FlightType.multiCity,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomBackgroundHeader(
              height: 294.0,
              image: BackgroundImage.searchResults,
              title: LocaleKeys.searchResult.tr(),
            ),
          ),
          PositionedDirectional(
            top: AppConstants.kNotchHeight + 170.0,
            start: 61.0,
            child: Text(
              toCity.substring(0, toCity.length < 3 ? toCity.length : 3).toUpperCase(),
              style: TextStyleManager.semiBold(size: 30, color: AppColors.white),
            ),
          ),
          PositionedDirectional(
            top: AppConstants.kNotchHeight + 170.0,
            end: 61.0,
            child: Text(
              fromCity.substring(0, fromCity.length < 3 ? fromCity.length : 3).toUpperCase(),
              style: TextStyleManager.semiBold(size: 30, color: AppColors.white),
            ),
          ),
          Positioned.fill(
            top: AppConstants.kNotchHeight + 260.0,
            child: CustomScaffold(
              backgroundColor: AppColors.transparent,
              body: Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 21.0),
                width: MediaQuery.of(context).size.width,
                child: Consumer(
                  builder: (context, ref, child) {
                    final flightList = ref.watch(SearchResultsViewModel.searchListProvider);
                    return (flightList == null || flightList.isLoading)
                        ? const CustomProgressIndicator()
                        : flightList.hasValue && (flightList.value ?? []).isEmpty
                            ? Center(
                                child: Text(LocaleKeys.noAvailableResults.tr()),
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ///   available flights
                                  Text(
                                    LocaleKeys.flightsAvailable.tr(args: [(flightList.value ?? []).length.toString()]),
                                    style: TextStyleManager.medium(size: 14.0, color: AppColors.white),
                                  ),
                                  const SizedBox(height: 40),

                                  ///   search results list
                                  Expanded(
                                    child: CustomScrollView(
                                      slivers: [
                                        SliverList(
                                          delegate: SliverChildBuilderDelegate(
                                            childCount: (flightList.value ?? []).length,
                                            (context, index) =>
                                                SearchResultCard(flight: (flightList.value ?? [])[index]!),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
