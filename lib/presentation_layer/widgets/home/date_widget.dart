import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/utils/date_time_util.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/screens/home/home_view_model.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_text_form_field.dart';

class DateWidget extends ConsumerStatefulWidget {
  const DateWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends ConsumerState<ConsumerStatefulWidget> {
  final _dateController = TextEditingController();

  @override
  void initState() {
    _dateController.text = DateTimeUtil.getMonthDayYearDate(DateTime.now())!;
    super.initState();
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _presentDatePicker(ref, context),
      child: CustomTextFormField(
        controller: _dateController,
        title: LocaleKeys.date.tr(),
        enabled: false,
      ),
    );
  }

  Future<void> _presentDatePicker(WidgetRef ref, BuildContext context) async {
    await _presentDatePickerPopup(
      (newDate) {
        debugPrint("DATE PICKED IN SCREEN -> $newDate");
        ref.read(HomeViewModel.dateBookingProvider.notifier).state = newDate;
        _dateController.text = DateTimeUtil.getMonthDayYearDate(newDate)!;
      },
      context,
      initialDate: ref.read(HomeViewModel.dateBookingProvider),
      lastDate: DateTime.now(),
    );
  }

  Future<void> _presentDatePickerPopup(
    Function(DateTime) onDatePicked,
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: initialDate ?? DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            maximumDate: DateTime.now(),
            minimumDate: firstDate != null ? DateTime(firstDate.year, firstDate.month, firstDate.day) : DateTime(1900),
            // This is called when the user changes the date.
            onDateTimeChanged: (DateTime newDate) {
              onDatePicked(newDate);
            },
          ),
        ),
      ),
    );
  }
}
