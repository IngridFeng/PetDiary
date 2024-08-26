import 'nav_bar_data.dart';
import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  NavBarState navBarState = NavBarState.home;

  void setNavBarState([NavBarState? newNavBarState]) {
    if (newNavBarState != null) {
      navBarState = newNavBarState;
    }
    notifyListeners();
  }
}
