import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flashcard_app/FrontEnd/HomeView/HomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlashCards',//Só serve pra dar nome na página web
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
