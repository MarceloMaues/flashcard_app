import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flashcard_app/BackEnd/Menu.dart';

class Controller extends ChangeNotifier {
  //static Controller get to=>  Get.find();
  //final Menu _model = Menu();

  List<String> _decks = ['1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];
  List<String> get decks => _decks;


  //Menu get model => _model;


  void addDeck(){
    _decks.add('a');
    notifyListeners();
  }
}