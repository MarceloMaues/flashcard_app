import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'package:flutter/cupertino.dart';
import 'BackEnd/DataStructures/Deck.dart';
import 'package:flashcard_app/BackEnd/IO/DeckFilesManipulation.dart';

class Controller extends ChangeNotifier {
  DeckFilesManipulation filesIO = DeckFilesManipulation();
  List<String> deckNames = [];
  Deck? _selectedDeck;



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
    if(!deckNames.contains(_selectedDeck)){
      deckNames.add(_selectedDeck!.getDeckName());
      notifyListeners();
    }
  }

  void updateDeck(){

  }

  void getDeckNames() {
      filesIO.readListNameDecks().then((result){
        if (result is List<String>){
          deckNames= result;
          notifyListeners();
        }
      });
  }

  void addDeck(){
    _decks.add('a');
    notifyListeners();
  }

}