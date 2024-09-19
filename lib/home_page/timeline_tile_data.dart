import 'package:flutter/material.dart';

// TODO: Add upcoming events e.g. dog park events
enum TimelineTileType {
  visitDoctor(Icons.health_and_safety),
  playWithHuman(Icons.photo_camera),
  playWithFriend(Icons.pets);

  final IconData indicatorIcon;
  const TimelineTileType(this.indicatorIcon);
}

Map<String, List<TimelineTileType>> timelineTileTypeMap = {
  "All Diary Events": TimelineTileType.values,
  "Doctor Visits": [TimelineTileType.visitDoctor],
  "Play with Human": [TimelineTileType.playWithHuman],
  "Play with Friends": [TimelineTileType.playWithFriend],
};

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
