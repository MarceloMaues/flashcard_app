import 'package:flashcard_app/FrontEnd/EditDeckView/EditDeckView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flashcard_app/FrontEnd/HomeView/HomeView.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'Controller.dart';
import 'FrontEnd/CreateDeckView/CreateDeckView.dart';
import 'package:flashcard_app/FrontEnd/FlashCardFront/FlashCardFront.dart';

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
      routes:{
        '/CreateDeckView':(context) => CreateDeckView(),
        '/GameView':(context) => GameView(),
        '/EditDeckView':(context) => DeckEdit(),
      },
    );
  }
}
