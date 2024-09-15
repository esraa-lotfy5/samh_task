import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/enums/flight_class_type.dart';
import 'package:samh_task/core/extensions/context_extensions.dart';
import 'package:samh_task/generated/locale_keys.g.dart';
import 'package:samh_task/presentation_layer/screens/home/home_view_model.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_button.dart';
import 'package:samh_task/presentation_layer/widgets/home/class_widget.dart';
import 'package:samh_task/presentation_layer/widgets/home/date_widget.dart';
import 'package:samh_task/presentation_layer/widgets/home/from_to_widget.dart';
import 'package:samh_task/presentation_layer/widgets/home/travellers_widget.dart';

class BookingForm extends ConsumerStatefulWidget {
  const BookingForm({super.key});

  @override
  ConsumerState createState() => _BookingFormState();
}

class _BookingFormState extends ConsumerState<BookingForm> {
  final _formKey = GlobalKey<FormState>(); //  Form keys

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(bottom: 40.0),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20.0, vertical: 30.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            /// From to text form fields.
            const FromToWidget(),
            const SizedBox(height: 20.0),

            /// Date picker
            const DateWidget(),
            const SizedBox(height: 20.0),

            /// Travellers and Class
            Row(
              children: [
                const Flexible(child: TravellersDropDownMenu()),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Consumer(
                    builder: (context, ref, child) {
                      final selectedValue = ref.watch(HomeViewModel.classBookingProvider);
                      return ClassWidget(items: FlightClassType.values, selectedValue: selectedValue);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            /// Search flights button
            CustomButton(
              title: LocaleKeys.searchFlights.tr(),
              onPressed: () {
                if (_validateForm(ref)) {
                  print("Validated");
                } else {
                  context.showNativeSnackBar(text: LocaleKeys.fillForm.tr());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  bool _validateForm(WidgetRef ref) {
    return (ref.read(HomeViewModel.fromBookingProvider) != null) &&
        (ref.read(HomeViewModel.toBookingProvider) != null) &&
        (ref.read(HomeViewModel.classBookingProvider) != null);
  }
}
