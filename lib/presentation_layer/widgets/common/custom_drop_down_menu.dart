import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';
import 'package:samh_task/generated/locale_keys.g.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.items,
    this.selectedValue,
    this.hintText,
    required this.labelText,
    this.labelColor = AppColors.primary,
    this.itemFontSize = 14.0,
    this.onChange,
    this.isExpanded = false,
  });

  final List<dynamic> items;
  final Color labelColor;
  final double itemFontSize;
  final String? selectedValue;
  final String? hintText;
  final String labelText;
  final void Function(dynamic value)? onChange;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          /// Add margin to handle label position as design
          margin: const EdgeInsetsDirectional.only(top: 8.0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<dynamic>(
              isExpanded: isExpanded,
              value: selectedValue,
              hint: Text(
                selectedValue ?? hintText ?? LocaleKeys.select.tr(),
                style: TextStyleManager.semiBold(
                  fontSize: itemFontSize,
                  color: AppColors.primary,
                ),
              ),
              items: items
                  .map(
                    (dynamic item) => DropdownMenuItem<dynamic>(
                      value: item,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(item),
                      ),
                    ),
                  )
                  .toList(),
              // dropdownSeparator: const DropdownSeparator(
              //   height: 4,
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 8.0),
              //     child: Divider(),
              //   ),
              // ),
              // valueListenable: valueListenable,
              style: TextStyleManager.semiBold(fontSize: 14.0),
              onChanged: onChange,
              buttonStyleData: ButtonStyleData(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0, vertical: 5.0),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grayishRedOpacity30, width: 1.0),
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
              labelText,
              style: TextStyleManager.medium(fontSize: 12.0, color: AppColors.grayishRed),
            ),
          ),
        ),
      ],
    );
  }
}
