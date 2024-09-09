import 'package:flutter/material.dart';

enum TimelineTileType {
  // upcoming,
  // doctorVisit,
  playWithHuman,
  // playWithFriend,
  // visitFriend,
}

class TimelineTileData {
  final String date;
  final IconData indicatorIcon;
  final String description;
  final Image? image;

  TimelineTileData(
      {Key? key,
      required this.date,
      required this.indicatorIcon,
      required this.description,
      this.image});
}

class TimelineTileItems {
  const TimelineTileItems();

  List<TimelineTileData> fetchData() {
    // TODO: RPC to get data here.
    return [
      TimelineTileData(
          date: "Sep 1, 2024",
          indicatorIcon: Icons.photo_camera,
          description: "Ingrid took a picture for me. Yoo-hoo!",
          image: const Image(
            image: AssetImage('lib/home_page/assets/yuumi.jpg'),
            height: 200,
          )),
      TimelineTileData(
          date: "Aug 30, 2024",
          indicatorIcon: Icons.photo_camera,
          description: "Ingrid took a picture for me. Yoo-hoo!",
          image: const Image(
            image: AssetImage('lib/home_page/assets/milan.jpg'),
            height: 200,
          )),
      TimelineTileData(
          date: "Aug 30, 2024",
          indicatorIcon: Icons.photo_camera,
          description: "Ingrid took a picture for me. Yoo-hoo!",
          image: const Image(
            image: AssetImage('lib/home_page/assets/milan.jpg'),
            height: 200,
          )),
    ];
  }
}
