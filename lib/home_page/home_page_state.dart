import 'package:flutter/material.dart';
import 'timeline_tile_items.dart';

Map<String, List<TimelineTileType>> timelineTileTypeMap = {
  "All Diary Events": TimelineTileType.values,
  "Doctor Visits": [TimelineTileType.visitDoctor],
  "Play with Human": [TimelineTileType.playWithHuman],
  "Play with Friends": [TimelineTileType.playWithFriend],
};

class HomePageState extends ChangeNotifier {
  String selectedTimelineTileType = "All Diary Events";
  late List<TimelineTileData> timelineTileItems =
      const TimelineTileItems().fetchData(TimelineTileType.values.toSet());

  void setTimelineTileType(String type) {
    selectedTimelineTileType = type;
    timelineTileItems =
        const TimelineTileItems().fetchData(timelineTileTypeMap[type]!.toSet());
    notifyListeners();
  }

  void addTimelineTile(TimelineTileData timelineTileData) {
    timelineTileItems.add(timelineTileData);
    notifyListeners();
  }

  void removeAllTimelineTiles() {
    timelineTileItems.clear();
    notifyListeners();
  }
}
