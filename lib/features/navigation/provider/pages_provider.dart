import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavPage { categories, favorite }

class PagesNotifier extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void openScreens(NavPage screen) {
    if (screen == NavPage.categories) {
      state = 1;
    } else {
      state = 2;
    }
  }

  void setNavigationScreen(int index) {
    state = index;
  }
}

final pagesProvider = NotifierProvider<PagesNotifier, int>(PagesNotifier.new);
