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
        selectedPage = const Placeholder(color: Colors.blue);
      case NavBarState.chat:
        selectedPage = const Placeholder(color: Colors.blue);
      case NavBarState.profile:
        selectedPage = const Placeholder(color: Colors.blue);
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

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Navigation bar appears at the bottom for narrow screens (e.g. phones)
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: mainArea),
                BottomNavigationBar(
                  items: [
                    for (var navBarState in NavBarState.values)
                      BottomNavigationBarItem(
                          icon: Icon(NavBarItem(navBarState: navBarState)
                              .getData()
                              .icon),
                          label: NavBarItem(navBarState: navBarState)
                              .getData()
                              .label),
                  ],
                  currentIndex: appState.navBarState.index,
                  onTap: (selectedIndex) {
                    appState.setNavBarState(NavBarState.values[selectedIndex]);
                  },
                ),
              ],
            );
          } else {
            // Navigation bar appears at the left for wider screens (e.g. web)
            return Row(
              children: [
                NavigationRail(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  extended: constraints.maxWidth >= 600,
                  destinations: NavBarState.values
                      .map(
                        (navBarState) => NavigationRailDestination(
                            icon: Icon(NavBarItem(navBarState: navBarState)
                                .getData()
                                .icon),
                            label: Text(NavBarItem(navBarState: navBarState)
                                .getData()
                                .label)),
                      )
                      .toList(),
                  selectedIndex: appState.navBarState.index,
                  onDestinationSelected: (selectedIndex) {
                    appState.setNavBarState(NavBarState.values[selectedIndex]);
                  },
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
