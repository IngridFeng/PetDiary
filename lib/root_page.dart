import 'package:flutter/material.dart';
import 'nav_bar_data.dart';
import 'home_page.dart';
import 'app_state.dart';
import 'package:provider/provider.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPage();
}

class _RootPage extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    Widget selectedPage;
    switch (appState.navBarState) {
      case NavBarState.home:
        selectedPage = const HomePage();
      case NavBarState.friends:
        selectedPage = const Placeholder(color: Colors.amber);
      case NavBarState.chat:
        selectedPage = const Placeholder(color: Colors.green);
      case NavBarState.profile:
        selectedPage = const Placeholder(color: Colors.yellow);
      default:
        throw UnimplementedError(
            "$appState.navBarState not implemented for the page.");
    }

    // The container for the current page, with its background color
    // and subtle switching animation.
    var mainArea = ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: selectedPage,
      ),
    );

    // Navigation bar appears at the bottom for narrow screens (e.g. phones)
    if (MediaQuery.of(context).size.width < 450) {
      return Scaffold(
        body: mainArea,
        bottomNavigationBar: NavigationBar(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          destinations: NavBarState.values
              .map(
                (navBarState) => NavigationDestination(
                  icon:
                      Icon(NavBarItem(navBarState: navBarState).getData().icon),
                  label: NavBarItem(navBarState: navBarState).getData().label,
                ),
              )
              .toList(),
          selectedIndex: appState.navBarState.index,
          indicatorColor: Theme.of(context).colorScheme.inversePrimary,
          onDestinationSelected: (selectedIndex) {
            appState.setNavBarState(NavBarState.values[selectedIndex]);
          },
        ),
      );
    } else {
      // Navigation bar appears at the left for wider screens (e.g. web)
      return Scaffold(
        body: Row(
          children: <Widget>[
            NavigationRail(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              extended: MediaQuery.of(context).size.width >= 600,
              destinations: NavBarState.values
                  .map(
                    (navBarState) => NavigationRailDestination(
                      icon: Icon(
                          NavBarItem(navBarState: navBarState).getData().icon),
                      label: Text(
                          NavBarItem(navBarState: navBarState).getData().label),
                    ),
                  )
                  .toList(),
              selectedIndex: appState.navBarState.index,
              indicatorColor: Theme.of(context).colorScheme.inversePrimary,
              onDestinationSelected: (selectedIndex) {
                appState.setNavBarState(NavBarState.values[selectedIndex]);
              },
            ),
            Expanded(child: mainArea),
          ],
        ),
      );
    }
  }
}
