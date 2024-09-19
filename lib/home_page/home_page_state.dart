import 'package:flutter/material.dart';
import 'timeline_tile_data.dart';

var fakeTimelineTiles = [
  const TimelineTileData(
    type: TimelineTileType.playWithHuman,
    date: "09/01/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/yuumi.jpg'),
      height: 200,
    ),
  ),
  const TimelineTileData(
    type: TimelineTileType.playWithHuman,
    date: "08/30/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
  const TimelineTileData(
    type: TimelineTileType.playWithFriend,
    date: "09/11/2024",
    description: "I visited a friend!",
    image: Image(
      image: AssetImage('lib/home_page/assets/yuumi.jpg'),
      height: 200,
    ),
  ),
  const TimelineTileData(
    type: TimelineTileType.playWithHuman,
    date: "08/27/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
  const TimelineTileData(
    type: TimelineTileType.playWithFriend,
    date: "09/12/2024",
    description: "I visited a friend!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
];

class HomePageState extends ChangeNotifier {
  String selectedTimelineTileType = "All Diary Events";
  late List<TimelineTileData> allTimelineTiles = _initTimelineTiles();
  late List<TimelineTileData> filteredTimelineTiles =
      _updateFilteredTimelineTiles();

  // TODO: RPC to get data here.
  List<TimelineTileData> _initTimelineTiles() {
    return fakeTimelineTiles;
  }

  List<TimelineTileData> _updateFilteredTimelineTiles() {
    var items = allTimelineTiles
        .where((i) => timelineTileTypeMap[selectedTimelineTileType]!
            .toSet()
            .contains(i.type))
        .toList();
    items.sort((a, b) => b.date.compareTo(a.date));
    return items;
  }

  void setTimelineTileType(String type) {
    selectedTimelineTileType = type;
    filteredTimelineTiles = _updateFilteredTimelineTiles();
    notifyListeners();
  }

  void addTimelineTile(TimelineTileData timelineTileData) {
    allTimelineTiles.add(timelineTileData);
    filteredTimelineTiles = _updateFilteredTimelineTiles();
    notifyListeners();
  }

  void removeAllTimelineTiles() {
    allTimelineTiles.clear();
    filteredTimelineTiles.clear();
    notifyListeners();
  }
}
