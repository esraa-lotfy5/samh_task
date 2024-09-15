import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/presentation_layer/screens/home/home_view_model.dart';

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
      height: 423.0,
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(bottom: 40.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [Text(ref.watch(HomeViewModel.tabsIndexProvider).toString())],
      ),
    );
  }
}
