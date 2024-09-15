import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/constants/app_images.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';
import 'package:samh_task/core/utils/date_time_util.dart';
import 'package:samh_task/data_layer/models/flight_model.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_button.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_image.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key, required this.flight});

  final FlightModel flight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage.svg(src: AppSvg.searchCardBackground),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 30, end: 30, top: 20, bottom: 16),
          child: Column(
            children: [
              /// Company name and price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    flight.companyName ?? "",
                    style: TextStyleManager.bold(size: 16.0),
                  ),
                  CustomImage.network(src: flight.companyImage, height: 48.0),
                  Text(
                    "\$${flight.price}",
                    style: TextStyleManager.semiBold(size: 18.0, color: AppColors.secondary),
                  ),
                ],
              ),
              const SizedBox(height: 15.0),

              /// Arrive and depart
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.depart.tr(),
                        style: TextStyleManager.medium(size: 12.0, color: AppColors.grayishRed),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        DateTimeUtil.getHourMinute(flight.departTime) ?? "",
                        style: TextStyleManager.semiBold(size: 20.0),
                      ),
                    ],
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Dash(length: 20, dashLength: 3, dashColor: AppColors.lightGrayishBlue),
                      DottedBorder(
                        color: AppColors.lightGrayishBlue,
                        strokeWidth: 1,
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(20),
                        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                        dashPattern: const [3],
                        child: Container(
                          height: 25.0,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
                          child: Center(
                            child: Text(
                              DateTimeUtil.getDifferanceOnHoursAndMinutes(flight.departTime!, flight.arriveTime!) ?? "",
                              style: TextStyleManager.medium(size: 12.0, color: AppColors.darkGrayishBlue),
                            ),
                          ),
                        ),
                      ),
                      const Dash(length: 20, dashLength: 3, dashColor: AppColors.lightGrayishBlue),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.arrive.tr(),
                        style: TextStyleManager.medium(size: 12.0, color: AppColors.grayishRed),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        DateTimeUtil.getHourMinute(flight.arriveTime) ?? "",
                        style: TextStyleManager.semiBold(size: 20.0),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15.0),

              /// View more size
              CustomButton(
                title: LocaleKeys.viewMore.tr(),
                backgroundColor: AppColors.transparent,
                textStyle: TextStyleManager.semiBold(size: 14.0, color: AppColors.primary),
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
