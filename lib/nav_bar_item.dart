import 'package:flutter/material.dart';

enum NavBarState {
  home,
  friends,
  chat,
  profile,
}

class NavBarItemData {
  final IconData icon;
  final String label;

  NavBarItemData({required this.icon, required this.label});
}

class NavBarItem {
  const NavBarItem({required this.navBarState});

  final NavBarState navBarState;

  NavBarItemData getData() {
    switch (navBarState) {
      case NavBarState.home:
        return NavBarItemData(icon: Icons.home_outlined, label: "Home");
      case NavBarState.friends:
        return NavBarItemData(icon: Icons.favorite_border, label: "Friends");
      case NavBarState.chat:
        return NavBarItemData(icon: Icons.chat_bubble_outline, label: "Chat");
      case NavBarState.profile:
        return NavBarItemData(icon: Icons.person_outline, label: "Profile");
      default:
        throw UnimplementedError(
            "$navBarState not implemented for NavBarItem.");
    }
  }
}
