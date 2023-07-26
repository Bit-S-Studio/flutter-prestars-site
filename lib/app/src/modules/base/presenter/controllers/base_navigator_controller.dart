import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../prestars_exports.dart';

class BaseNavigatorController extends ValueNotifier<List<TabEntity>> {
  BaseNavigatorController() : super([]);

  void init() {
    final tabs = GetTabsItems.call();
    value = tabs;
  }

  int currentIndex(BuildContext context) =>
      _locationToTabIndex(GoRouterState.of(context).location);

  int _locationToTabIndex(String location) {
    final index = value.indexWhere((t) => location == t.route);
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != currentIndex(context)) {
      // go to the initial location of the selected tab (by index)
      context.go(value[tabIndex].route);
    }
  }
}
