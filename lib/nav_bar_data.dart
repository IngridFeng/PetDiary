import 'package:flutter/material.dart';

enum NavBarState {
  home,
  friends,
  chat,
  profile,
}

class NavBarItemData {
  IconData icon = Icons.home_outlined;
  String label = "Home";

  NavBarItemData(this.icon, this.label);
}

class NavBarItem {
  const NavBarItem({required this.navBarState});

  final NavBarState navBarState;

  NavBarItemData getData() {
    switch (navBarState) {
      case NavBarState.home:
        return NavBarItemData(Icons.home_outlined, "Home");
      case NavBarState.friends:
        return NavBarItemData(Icons.favorite_border, "Friends");
      case NavBarState.chat:
        return NavBarItemData(Icons.chat_bubble_outline, "Chat");
      case NavBarState.profile:
        return NavBarItemData(Icons.person_outline, "Profile");
      default:
        throw UnimplementedError(
            "$navBarState not implemented for NavBarItem.");
    }
  }
}
