import 'package:flutter/material.dart';

// TODO: Add upcoming events e.g. dog park events
enum DiaryType {
  visitDoctor(Icons.health_and_safety),
  playWithHuman(Icons.photo_camera),
  playWithFriend(Icons.pets);

  final IconData indicatorIcon;
  const DiaryType(this.indicatorIcon);
}

Map<String, List<DiaryType>> diaryTypeMap = {
  "All Diary Events": DiaryType.values,
  "Doctor Visits": [DiaryType.visitDoctor],
  "Play with Human": [DiaryType.playWithHuman],
  "Play with Friends": [DiaryType.playWithFriend],
};

class DiaryData {
  final DiaryType type;
  final String date;
  final String description;
  final Image? image;

  const DiaryData(
      {Key? key,
      required this.type,
      required this.date,
      required this.description,
      this.image});
}
