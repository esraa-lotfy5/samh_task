import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/generated/locale_keys.g.dart';

class FlightScreen extends ConsumerStatefulWidget {
  const FlightScreen({super.key});

  @override
  ConsumerState createState() => _FlightScreenState();
}

class _FlightScreenState extends ConsumerState<FlightScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("2222222"),
    );
  }
}
