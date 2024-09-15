import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/presentation_layer/screens/flight/flight_screen.dart';
import 'package:samh_task/presentation_layer/screens/home/home_screen.dart';
import 'package:samh_task/presentation_layer/screens/tabs/tabs_view_model.dart';
import 'package:samh_task/presentation_layer/screens/search/search_screen.dart';
import 'package:samh_task/presentation_layer/widgets/common/custom_scaffold.dart';

class TabsScreen extends ConsumerWidget {
  TabsScreen({super.key});

  final _children = [
    const HomeScreen(),
    const FlightScreen(),
    const SearchScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final selectedIndex = ref.watch(TabsViewModel.bottomTabsIndex);
    return CustomScaffold(
      backgroundColor: AppColors.white,
      body: _children[selectedIndex],
    );
  }
}
