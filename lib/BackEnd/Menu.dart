import 'package:flutter/material.dart';

class Menu{
  List<String> _decks =[
    '1',
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
  List<String> get decks => getMyDecks();
  
  void teste(String batata){
    _decks.add(batata);
  }
  List<String> getMyDecks(){
    return _decks;
  }
}