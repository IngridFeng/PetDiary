import 'package:flutter/material.dart';
import 'diary_data.dart';

var fakeDiaries = [
  const DiaryData(
    type: DiaryType.playWithHuman,
    date: "09/01/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/yuumi.jpg'),
      height: 200,
    ),
  ),
  const DiaryData(
    type: DiaryType.playWithHuman,
    date: "08/30/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
  const DiaryData(
    type: DiaryType.playWithFriend,
    date: "09/11/2024",
    description: "I visited a friend!",
    image: Image(
      image: AssetImage('lib/home_page/assets/yuumi.jpg'),
      height: 200,
    ),
  ),
  const DiaryData(
    type: DiaryType.playWithHuman,
    date: "08/27/2024",
    description: "Ingrid took a picture for me. Yoo-hoo!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
  const DiaryData(
    type: DiaryType.playWithFriend,
    date: "09/12/2024",
    description: "I visited a friend!",
    image: Image(
      image: AssetImage('lib/home_page/assets/milan.jpg'),
      height: 200,
    ),
  ),
];

class HomePageState extends ChangeNotifier {
  String selectedDiaryType = "All Diary Events";
  late List<DiaryData> allDiaries = _initDiaries();
  late List<DiaryData> filteredDiaries = _updateFilteredDiaries();

  // TODO: RPC to get data here.
  List<DiaryData> _initDiaries() {
    return fakeDiaries;
  }

  List<DiaryData> _updateFilteredDiaries() {
    var items = allDiaries
        .where((i) => diaryTypeMap[selectedDiaryType]!.toSet().contains(i.type))
        .toList();
    items.sort((a, b) => b.date.compareTo(a.date));
    return items;
  }

  void setDiaryType(String type) {
    selectedDiaryType = type;
    filteredDiaries = _updateFilteredDiaries();
    notifyListeners();
  }

  void addDiary(DiaryData diaryData) {
    allDiaries.add(diaryData);
    filteredDiaries = _updateFilteredDiaries();
    notifyListeners();
  }

  void removeAllDiaries() {
    allDiaries.clear();
    filteredDiaries.clear();
    notifyListeners();
  }
}
