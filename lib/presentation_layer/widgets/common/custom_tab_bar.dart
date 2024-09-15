import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:samh_task/core/constants/app_colors.dart';
import 'package:samh_task/core/managers/text_style_manager.dart';

class CustomTabBar extends ConsumerStatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    this.currentIndex,
    this.onTap,
    this.indicatorColor = AppColors.white,
    this.labelColor = AppColors.white,
    this.showDivider = true,
  });

  final List<Widget> tabs;
  final int? currentIndex;
  final Function(int index)? onTap;
  final Color? indicatorColor;
  final Color? labelColor;
  final bool showDivider;

  @override
  ConsumerState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends ConsumerState<CustomTabBar> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(length: widget.tabs.length, vsync: this);
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      labelStyle: TextStyleManager.medium(size: 14, color: AppColors.white),
      labelColor: widget.labelColor,
      unselectedLabelStyle: TextStyleManager.medium(size: 14, color: AppColors.whiteOpacity5),
      unselectedLabelColor: AppColors.whiteOpacity5,
      dividerColor: AppColors.transparent,
      overlayColor: WidgetStateProperty.all(AppColors.transparent),
      indicatorPadding: const EdgeInsetsDirectional.only(bottom: 10),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 1.0, color: Colors.white), // Change the thickness and color of the indicator
        insets: EdgeInsetsDirectional.only(end: 40.0, top: 2.0), // Adjust horizontal padding to make it smaller
      ),
      onTap: widget.onTap,
      tabs: widget.tabs,
    );
  }
}
