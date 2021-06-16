import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'BackEnd/DataStructures/Deck.dart';
import 'package:flashcard_app/BackEnd/IO/DeckFilesManipulationMobile.dart'
    if (dart.library.html) 'package:flashcard_app/BackEnd/IO/DeckFilesManipulationWeb.dart';

class Controller extends ChangeNotifier {
  DeckFilesManipulation fileIO = DeckFilesManipulation();

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
  String get selectedName => _selectedDeck.getDeckName();
  String get frontActualCard => _actualGame.getFrontSide();
  String get backActualCard => _actualGame.getBackSide();
  List<List<String>> get deckFaces => [];
  int get numCards => _selectedDeck.getDeckSize();
  List<String> get deckNames => getDeckNames();

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

  List<List<String>> getDeckFaces(){
    List<List<String>> faces =[];
    faces.add([]);
    faces.add([]);
    for(int i= 0;i<_selectedDeck.getDeckSize();i++){
      faces[0].add(_selectedDeck.getFlashCard(i).getFrontSide());
      faces[1].add(_selectedDeck.getFlashCard(i).getBackSide());
    }
    return faces;
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
        _selectedDeck =_myDecks[i];
        renameDack(deckName);
      }
      i++;
    }
    if(!found){
      _selectedDeck = Deck(deckName);
    }
    saveDeck();
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

  void selectCardOrAdd(String front,String back){
    int i = 0;
    bool found = false;

    while((i<_myDecks.length)&&(!found)){
      if(_selectedDeck.getFlashCard(i).getFrontSide()==front){
        if(_selectedDeck.getFlashCard(i).getBackSide()==back){
          _actualGame = _selectedDeck.getFlashCard(i);
          found = true;
        }
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
    if(!found){
      _selectedDeck.addFlashCard(FlashCard(newBack, newFront));
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

  void importDeck() async{
    _selectedDeck = await fileIO.readFileDeck("a");
    createNewDeck(_selectedDeck.getDeckName());
    saveDeck();
  }

  void exportDeck(){
    notifyListeners();
  }

}