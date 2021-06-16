import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'package:flutter/cupertino.dart';
import 'BackEnd/DataStructures/Deck.dart';

class Controller extends ChangeNotifier {
  //DeckFilesManipulationWeb fileIO = DeckFilesManipulationWeb();
  List<Deck> _myDecks = [];
  Deck _selectedDeck;
  FlashCard _actualGame;
  bool _backCard = false;
  bool _correctAnswer = false;
  bool _acertou = false;
  int _score = 0;

  int get score => _score;
  bool get backCard => _backCard;
  bool get acertou => _acertou;
  bool get correctAnswer => _correctAnswer;

  void setAcertou(bool oi){
    _acertou =oi;
  }

  void flipCard(){
    _backCard= !_backCard;
    notifyListeners();
  }

  void addScore(){
    _score = _score+1;
    notifyListeners();
  }

  void resetScore(){
    _score = 0;
    notifyListeners();
  }

  void isCorrectAnswer(){
    _correctAnswer = !_correctAnswer;
    notifyListeners();
  }

  List<String> getDeckNames(){
    List<String> deckNames = [];
    for(int i = 0;i<_myDecks.length;i++){
      deckNames.add(_myDecks[i].getDeckName());
    }
    return deckNames;
  }

  void selectDeck(String name){
    bool found = false;
    int i = 0;
    while((i<_myDecks.length)&&(!found)){
      if(_myDecks[i].getDeckName()==name){
        found = true;
        _selectedDeck =_myDecks[i];
      }
      i++;
    }
    notifyListeners();
  }

  void createNewDeck(String deckName) {
    String newDeck = deckName;
    bool found = false;
    int i = 0;
    while((i<_myDecks.length)&&(!found)){
      if(_myDecks[i].getDeckName()==deckName){
        //todo
      }
    }
    _selectedDeck = Deck(deckName);
  }

  void renameDack(String rename){
    int i = 0;
    bool found = false;
    while((i<_myDecks.length)&&(!found)){
      if(_myDecks[i].getDeckName()==_selectedDeck.getDeckName()){
        _selectedDeck.renameDeck(rename);
        _myDecks[i].renameDeck(rename);
        found = true;
      }
      i++;
    }
    notifyListeners();
  }


  void addCard(String frontName, String backName) {
    _selectedDeck.addFlashCard(FlashCard(frontName, backName));
    saveDeck();
    notifyListeners();
  }

  void removeCard(String frontName, String backName) {
    bool found = false;
    int i = 0;
    while((i<_selectedDeck.getDeckSize())&&(!found)){
      FlashCard card = _selectedDeck.getFlashCard(i);
      if((card.getFrontSide()==frontName)&&(card.getBackSide()==backName)){
        _selectedDeck.removeFlashCard(_selectedDeck.getFlashCard(i));
        found = true;
      }
      i++;
    }
    notifyListeners();
  }

  void editCard(String oldBack,String oldFront,String newBack ,String newFront){
    bool found = false;
    int i = 0;
    while((i<_selectedDeck.getDeckSize())&&(!found)){
      FlashCard card = _selectedDeck.getFlashCard(i);
      if((card.getFrontSide()==oldFront)&&(card.getBackSide()==oldBack)){
        _selectedDeck.getFlashCard(i).setBackSide(newBack);
        _selectedDeck.getFlashCard(i).setBackSide(newFront);
        found = true;
      }
      i++;
    }
    notifyListeners();
  }

  void saveDeck() {
    int i = 0;
    bool found = false;
    while((i<_myDecks.length)&&(!found)){
      if(_myDecks[i].getDeckName()==_selectedDeck.getDeckName()){
        _myDecks[i]=_selectedDeck;
        found = true;
      }
      i++;
    }
    if(!found){
      _myDecks.add(_selectedDeck);
    }
    notifyListeners();
  }

  void removeDeck(){
    int i = 0;
    bool found = false;
    while((i<_myDecks.length)&&(!found)){
      if(_myDecks[i].getDeckName()==_selectedDeck.getDeckName()){
        _myDecks.removeAt(i);
        found = true;
      }
      i++;
    }
    notifyListeners();
  }

  void importDeck(){
    notifyListeners();
  }

  void exportDeck(){
    notifyListeners();
  }

  void getDecksNamesAAA() async {
    //String a = await fileIO.readFile();
    //var dataName = jsonDecode(a);
    //print(dataName);
    //print(DeckTest.fromJson(dataName).name);
    //deckNames =
    FilePickerResult result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['json']);
    String jsonString = '';
    if (result != null) {
      try {
        jsonString = new String.fromCharCodes(result.files.first.bytes);
      } catch (e) {}
    }
    var dataName = jsonDecode(jsonString);
    print(dataName);
    //print(DeckTest.fromJson(dataName).name);
    notifyListeners();
  }

}