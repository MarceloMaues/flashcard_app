import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'BackEnd/DataStructures/Deck.dart';
import 'package:flashcard_app/BackEnd/IO/DeckFilesManipulationMobile.dart'
    if (dart.library.html) 'package:flashcard_app/BackEnd/IO/DeckFilesManipulationWeb.dart';

class Controller extends ChangeNotifier {
  DeckFilesManipulation fileIO = DeckFilesManipulation();

  ///Variavéis privadas
  Deck _selectedDeck = null;
  int _selectedDeckSize = 0;
  int _score = 0;
  bool _getCorrect = false;
  List<Deck> _myDecks = [];
  Deck _gameDeck;
  FlashCard _actualGame;
  bool _backCard = false;
  bool _correctAnswer = false;
  int deckSelected = -1;
  int cardSelected = -1;
  List<String> gameActualCard;

  ///Getters públicos
  int get score => _score;
  bool get backCard => _backCard;
  bool get checkBoxUpdator => _getCorrect;
  bool get correctAnswer => _correctAnswer;
  String get selectedName => _selectedDeck.getDeckName();
  String get frontActualCard => _actualGame.getFrontSide();
  String get backActualCard => _actualGame.getBackSide();
  List<List<String>> get deckFaces => [];
  int get numCards => _selectedDeck.getDeckSize();
  List<String> get deckNames => getDeckNames();
  int get selectedDeckSize => _selectedDeckSize;

  ///Vira a carta
  void flipCard() {
    _backCard = !_backCard;
    notifyListeners();
  }

  ///Adiciona um ponto ao score
  void addScore() {
    if(_getCorrect){
      _score = _score + 1;
    }
    notifyListeners();
  }

  ///Reseta o score
  void resetScore() {
    _score = 0;
    notifyListeners();
  }

  ///Confirma se a resposta esta correta
  void isCorrectAnswer() {
    _getCorrect = !_getCorrect;
    print(_getCorrect);
    notifyListeners();
  }

  ///Devolve o nome do deck
  List<String> getDeckNames() {
    List<String> deckNames = [];
    for (int i = 0; i < _myDecks.length; i++) {
      deckNames.add(_myDecks[i].getDeckName());
    }
    return deckNames;
  }

  ///Retorna as faces de todas os flashcard dentro do deck. Utilizada para mostrar as faces na edicao de deck
  List<List<String>> getDeckFaces() {
    List<List<String>> faces = [];
    faces.add([]);
    faces.add([]);
    for (int i = 0; i < _selectedDeck.getDeckSize(); i++) {
      faces[0].add(_selectedDeck.getFlashCard(i).getFrontSide());
      faces[1].add(_selectedDeck.getFlashCard(i).getBackSide());
    }
    return faces;
  }

  ///Seleciona um deck
  void selectDeck(int i) {
    deckSelected = i;
    _selectedDeck.copyDeckFrom(_myDecks[i]);
    _selectedDeckSize = _selectedDeck.getDeckSize();
    saveDeck();
    notifyListeners();
  }

  ///Cria um novo deck
  void createNewDeck(String deckName) {
    _selectedDeck = Deck(deckName);
    deckSelected = _myDecks.length;
    saveDeck();
  }

  ///Selecionar uma carta ou adicionar
  void selectCardOrAdd(String front, String back) {
    int i = 0;
    bool found = false;
    while ((i < _myDecks.length) && (!found)) {
      if (_selectedDeck.getFlashCard(i).getFrontSide() == front) {
        if (_selectedDeck.getFlashCard(i).getBackSide() == back) {
          _actualGame = _selectedDeck.getFlashCard(i);
          found = true;
        }
      }
      i++;
    }
    notifyListeners();
  }

  ///Funcao utilizada na hora de criar um novo deck que adicionar um flashcard
  void addCard(String frontName, String backName) {
    _selectedDeck.addFlashCard(FlashCard(frontName, backName));
    saveDeck();
    notifyListeners();
  }

  ///funcao utilizada na hora de criar um novo deck que remover um flashcard
  void removeCard(int index) {
    addScore();
    _selectedDeck.removeFlashCard(_selectedDeck.getFlashCard(index));
    notifyListeners();
  }

  ///funcao utilizada na hora de editar um flashcard
  void editCard(int i, String newBack, String newFront) {
    if (i >= 0) {
      _myDecks[deckSelected].setFlashCard(i, newFront, newBack);
    } else {
      _actualGame = new FlashCard(newBack, newFront);
      _selectedDeck.addFlashCard(_actualGame);
      cardSelected = _selectedDeck.getDeckSize();
    }
    saveDeck();
    notifyListeners();
  }

  // funcoes para o gameloop

  ///Devolve o nome do deck que esta sendo jogado
  String getSelectedDeckName() {
    _gameDeck = _selectedDeck;
    return _gameDeck.getDeckName();
  }

  ///Devolve o frontsite da carta na posicao 'num' dentro do gameDeck
  String getGameDeckCardFront(int num) {
    return _gameDeck.getFlashCard(num).getFrontSide();
  }

  ///Devolve o backside da carta na posicao 'num' dentro do gameDeck
  String getGameDeckCardBack(int num) {
    return _gameDeck.getFlashCard(num).getBackSide();
  }

  ///Remove o card do GameDeck
  void removeCardGameDeck(int num) {
    _gameDeck.removeFlashCard(_gameDeck.getFlashCard(num));
  }

  ///Muda as posicoes das cartas do deck aleatoriamente
  void randomCardGameDeck() {
    _gameDeck.getRandomCard();
  }

  ///Verifica se o gameloop tem que continuar. true  = acabou o jogo e false = continua
  bool endCheckGameLoop() {
    if (_gameDeck.getDeckSize() == 0) {
      resetScore();
      return true;
    } else {
      return false;
    }
  }

  ///Save o deck na memoria temporaria
  void saveDeck() {
    Deck newDeck = Deck("");
    int i = 0;
    bool found = false;
    while ((i < _myDecks.length) && (!found)) {
      if (_myDecks[i].getDeckName() == _selectedDeck.getDeckName()) {
        _myDecks[i] = _selectedDeck;
        found = true;
      }
      i++;
    }
    if (!found) {
      newDeck.copyDeckFrom(_selectedDeck);
      _myDecks.add(newDeck);
    }
    notifyListeners();
  }

  ///Remove o deck da memoria temporaria
  void removeDeck() {
    _myDecks.removeAt(deckSelected);
    notifyListeners();
  }

  ///Salva um arquivo do deck na plataforma utilizada
  void importDeck() async {
    _selectedDeck = await fileIO.readFileDeck("a");
    saveDeck();
  }

  ///Le um arquivo json e salva o deck lido na memoria temporaria
  void exportDeck() async {
    await fileIO.saveFileDeck('FlashCard', _selectedDeck);
    notifyListeners();
  }
}
