import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flashcard_app/BackEnd/Menu.dart';
import 'BackEnd/DataStructures/Deck.dart';

class Controller extends ChangeNotifier {
  List<String> _myDeckNames = [];
  Deck? _selectedDeck;
  List<FlashCard> _selectedCards = [];

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

  void createNewDeck(String deckName){
    _selectedDeck = Deck(deckName);
  }

  void addCard(String frontName,String backName){
    _selectedDeck!.addFlashCard(FlashCard(frontName, backName));
    notifyListeners();
  }

  void removeCard(String frontName,String backName){
    _selectedDeck!.addFlashCard(FlashCard(frontName, backName));
    notifyListeners();
  }

  void saveDeck(){
    if(_selectedDeck!.getDeckSize()>0){
      //Salvar deck
    }
    if(!_myDeckNames.contains(_selectedDeck)){
      _myDeckNames.add(_selectedDeck!.getDeckName());
      notifyListeners();
    }
  }

  void updateDeck(){

  }

  void oi (){

  }

  void addDeck(){
    _decks.add('a');
    notifyListeners();
  }

}