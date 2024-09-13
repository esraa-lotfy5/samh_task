import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsViewModel {
  static final bottomTabsIndex =
      StateNotifierProvider<BottomTabsIndexNotifier, int>((ref) => BottomTabsIndexNotifier(0));
}

class BottomTabsIndexNotifier extends StateNotifier<int> {
  BottomTabsIndexNotifier(super.state);

  void setIndex(int index) => state = index;
}
