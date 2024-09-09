import 'package:flutter/material.dart';
import 'timeline_tile_items.dart';

class HomePageState extends ChangeNotifier {
  late List<TimelineTileData> timelineTileItems =
      const TimelineTileItems().fetchData();

  void addTimelineTile(TimelineTileData timelineTileData) {
    timelineTileItems.add(timelineTileData);
    notifyListeners();
  }

  void removeAllTimelineTiles() {
    timelineTileItems.clear();
    notifyListeners();
  }
}
