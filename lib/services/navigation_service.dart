import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final ValueNotifier<int> currentTab = ValueNotifier(0);

  static void goToTab(int index) {
    currentTab.value = index;
  }

  static void openGranth(String granthId) {
    navigatorKey.currentState?.pushNamed('/granth/$granthId');
  }

  static void openTopic(String topicId) {
    navigatorKey.currentState?.pushNamed('/topic/$topicId');
  }

  static void goBack() {
    navigatorKey.currentState?.pop();
  }

  static void goHome() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
    currentTab.value = 0;
  }
}
