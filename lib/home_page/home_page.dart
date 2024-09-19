import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'timeline_tile_data.dart';
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
          const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 0) {
                  return _DiaryEntry(
                    isFirst: true,
                    isLast: index == homePageState.filteredTimelineTiles.length,
                    icon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(Icons.add),
                      iconSize: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                      onPressed: () {
                        setState(
                          () {
                            homePageState.addTimelineTile(
                              const TimelineTileData(
                                type: TimelineTileType.playWithHuman,
                                date: "09/16/2024",
                                description:
                                    "Ingrid took a picture for me. Yoo-hoo!",
                                image: Image(
                                  image: AssetImage(
                                      'lib/home_page/assets/yuumi.jpg'),
                                  height: 200,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    endChild: const Padding(
                      padding: EdgeInsets.only(
                          left: 16, right: 10, top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Add a diary entry"),
                        ],
                      ),
                    ),
                  );
                } else {
                  TimelineTileData timelineTileData =
                      homePageState.filteredTimelineTiles[index - 1];
                  return _DiaryEntry(
                    isFirst: false,
                    isLast: index == homePageState.filteredTimelineTiles.length,
                    icon: Icon(
                      timelineTileData.type.indicatorIcon,
                      size: 20,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    startChild: Center(
                      child: Container(
                        alignment: const Alignment(0.0, -0.45),
                        child: Text(timelineTileData.date),
                      ),
                    ),
                    endChild: Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 10, top: 20, bottom: 20),
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
                }
              },
              childCount: homePageState.filteredTimelineTiles.length + 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _DiaryEntry extends StatelessWidget {
  const _DiaryEntry({
    required this.isFirst,
    required this.isLast,
    required this.icon,
    this.startChild,
    required this.endChild,
  });

  final bool isFirst;
  final bool isLast;
  final Widget icon;
  final Widget? startChild;
  final Widget endChild;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      beforeLineStyle:
          LineStyle(color: Theme.of(context).colorScheme.inversePrimary),
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0.3,
        drawGap: true,
        width: 30,
        height: 30,
        indicator: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          child: icon,
        ),
      ),
      isFirst: isFirst,
      isLast: isLast,
      startChild: startChild,
      endChild: endChild,
    );
  }
}
