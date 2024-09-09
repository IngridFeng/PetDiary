import 'package:flutter/material.dart';
import 'root_page.dart';

void main() {
  runApp(const PetDiary());
}

class PetDiary extends StatelessWidget {
  const PetDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pet Diary",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const RootPage(),
    );
  }
}
