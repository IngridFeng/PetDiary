import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'timeline_tile_items.dart';
import 'home_page_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController timelineTileItemsTypeController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var homePageState = context.watch<HomePageState>();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Yuumi's Diary"),
            actions: <Widget>[
              const SizedBox(width: 24.0),
              DropdownMenu<String>(
                width: 210.0,
                initialSelection: homePageState.selectedTimelineTileType,
                textStyle: const TextStyle(fontSize: 18.0),
                controller: timelineTileItemsTypeController,
                requestFocusOnTap: false,
                onSelected: (String? type) {
                  setState(() {
                    homePageState.setTimelineTileType(type!);
                  });
                },
                inputDecorationTheme: const InputDecorationTheme(
                  filled: false,
                  border: InputBorder.none,
                ),
                dropdownMenuEntries: timelineTileTypeMap.keys
                    .map<DropdownMenuEntry<String>>((String type) {
                  return DropdownMenuEntry<String>(
                    value: type,
                    label: type,
                    enabled: true,
                  );
                }).toList(),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24.0)),
          homePageState.timelineTileItems.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: Text(
                        "You did not write any diary yet, Yuumi! Get started creating one!"),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      TimelineTileData timelineTileData =
                          homePageState.timelineTileItems[index];
                      return TimelineTile(
                        alignment: TimelineAlign.manual,
                        lineXY: 0.3,
                        beforeLineStyle: LineStyle(
                            color:
                                Theme.of(context).colorScheme.inversePrimary),
                        indicatorStyle: IndicatorStyle(
                          indicatorXY: 0.3,
                          drawGap: true,
                          width: 30,
                          height: 30,
                          indicator: _IconIndicator(
                              iconData: timelineTileData.type.indicatorIcon),
                        ),
                        isLast:
                            index == homePageState.timelineTileItems.length - 1,
                        startChild: Center(
                          child: Container(
                            alignment: const Alignment(0.0, -0.45),
                            child: Text(timelineTileData.date),
                          ),
                        ),
                        endChild: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 10, top: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                timelineTileData.description,
                              ),
                              if (timelineTileData.image != null)
                                timelineTileData.image!,
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: homePageState.timelineTileItems.length,
                  ),
                ),
        ],
      ),
    );
  }
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({required this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                iconData,
                size: 20,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
