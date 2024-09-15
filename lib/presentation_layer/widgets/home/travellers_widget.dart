import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/screens/home/home_view_model.dart';

class TravellersDropDownMenu extends ConsumerWidget {
  const TravellersDropDownMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          /// Add margin to handle label position as design
          margin: const EdgeInsetsDirectional.only(top: 8.0),
          width: MediaQuery.of(context).size.width,
          child: DropdownButtonHideUnderline(
            child: Consumer(
              builder: (context, ref, child) {
                final selectedValue = ref.watch(HomeViewModel.passengerNumberBookingProvider);
                return DropdownButton2<int>(
                  isExpanded: true,
                  value: selectedValue,
                  hint: Text(
                    selectedValue.toString(),
                    style: TextStyleManager.semiBold(size: 14.0, color: AppColors.primary),
                  ),
                  items: List.generate(20, (i) => i + 1)
                      .toList()
                      .map(
                        (int item) => DropdownMenuItem<int>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              '$item ${LocaleKeys.adult.tr()}',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  style: TextStyleManager.semiBold(size: 14.0),
                  onChanged: (value) => _setValue(ref, value),
                  buttonStyleData: ButtonStyleData(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0, vertical: 5.0),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.grayishRedOpacity38, width: 1.0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  dropdownStyleData: const DropdownStyleData(maxHeight: 200),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  iconStyleData: const IconStyleData(
                    openMenuIcon: Icon(Icons.keyboard_arrow_down_outlined),
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
                    iconEnabledColor: AppColors.primary,
                  ),
                );
              },
            ),
          ),
        ),

        /// Label
        PositionedDirectional(
          start: 30.0,
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 4.0),
            color: AppColors.white,
            child: Text(
              LocaleKeys.travellers.tr(),
              style: TextStyleManager.medium(size: 12.0, color: AppColors.grayishRed),
            ),
          ),
        ),
      ],
    );
  }

  void _setValue(WidgetRef ref, int? count) =>
      ref.read(HomeViewModel.passengerNumberBookingProvider.notifier).state = count ?? 1;
}
