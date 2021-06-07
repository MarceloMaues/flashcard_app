import 'package:mobx/mobx.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Menu{
  @observable
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


  void teste(String batata){
    _decks.add(batata);
  }
  List<String> getMyDecks(){
    return _decks;
  }
}