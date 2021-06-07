import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flashcard_app/FrontEnd/HomeView/HomeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'Controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Controller(),
      child: MyApp(),
     )
  );
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
