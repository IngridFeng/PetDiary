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
  @override
  Widget build(BuildContext context) {
    var homePageState = context.watch<HomePageState>();

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("Yuumi's Diary"),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10.0)),
          homePageState.timelineTileItems.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                  child: Text(
                      "Hi there, Yuumi! How's your day? Did you catach a fish? Or did you visit any friends? Get started by writting your diary."),
                ))
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
                              iconData: timelineTileData.indicatorIcon),
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
