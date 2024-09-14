import 'package:flutter/material.dart';

// TODO: Add upcoming events e.g. dog park events
enum TimelineTileType {
  visitDoctor(Icons.health_and_safety),
  playWithHuman(Icons.photo_camera),
  playWithFriend(Icons.pets);

  final IconData indicatorIcon;
  const TimelineTileType(this.indicatorIcon);
}

class TimelineTileData {
  final TimelineTileType type;
  final String date;
  final String description;
  final Image? image;

  const TimelineTileData(
      {Key? key,
      required this.type,
      required this.date,
      required this.description,
      this.image});
}

const fakeTimelineTileItems = [
  TimelineTileData(
    type: TimelineTileType.playWithHuman,
    date: "09/01/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/yuumi.jpg'),
      height: 200,
    ),
  ),
  TimelineTileData(
    type: TimelineTileType.playWithHuman,
    date: "08/30/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
  TimelineTileData(
    type: TimelineTileType.playWithFriend,
    date: "09/11/2024",
    description: "I visited a friend!",
    image: Image(
      image: AssetImage('lib/home_page/assets/yuumi.jpg'),
      height: 200,
    ),
  ),
  TimelineTileData(
    type: TimelineTileType.playWithHuman,
    date: "08/27/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
  TimelineTileData(
    type: TimelineTileType.playWithFriend,
    date: "09/12/2024",
    description: "I visited a friend!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
];

class TimelineTileItems {
  const TimelineTileItems();

  List<TimelineTileData> fetchData(Set<TimelineTileType> types) {
    // TODO: RPC to get data here.
    var timelineTileItems =
        fakeTimelineTileItems.where((i) => types.contains(i.type)).toList();
    timelineTileItems.sort((a, b) => b.date.compareTo(a.date));
    return timelineTileItems;
  }
}
