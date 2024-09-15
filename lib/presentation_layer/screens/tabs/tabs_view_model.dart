import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabsViewModel {
  static final bottomTabsIndex = StateProvider<int>((ref) => 0);
}
