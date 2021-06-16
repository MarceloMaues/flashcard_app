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
  int deckSelected = -1;
  int cardSelected = -1;

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

  void selectDeck(int i){
    deckSelected = i;
    _selectedDeck = _myDecks[i];
    saveDeck();
    notifyListeners();
  }

  void createNewDeck(String deckName) {
    _selectedDeck = Deck(deckName);
    deckSelected =_myDecks.length;
    saveDeck();
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

  void removeCard(int index) {
    _selectedDeck.removeFlashCard(_selectedDeck.getFlashCard(index));
    notifyListeners();
  }

  void editCard(int i,String newBack ,String newFront){
    if(i>=0){
      _myDecks[deckSelected].setFlashCard(i,newFront,newBack);
    }else{
      _actualGame = new FlashCard(newBack,  newFront);
      _selectedDeck.addFlashCard(_actualGame);
      cardSelected = _selectedDeck.getDeckSize();
    }
    saveDeck();
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
    _myDecks.removeAt(deckSelected);
    notifyListeners();
  }

  void importDeck() async{
    _selectedDeck = await fileIO.readFileDeck("a");
    saveDeck();
  }

  void exportDeck() async {
    await fileIO.saveFileDeck('FlashCard', _selectedDeck);
    notifyListeners();
  }

}