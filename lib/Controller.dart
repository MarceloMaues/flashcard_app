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
  Deck _gameDeck;
  FlashCard _actualGame;
  bool _backCard = false;
  bool _correctAnswer = false;
  bool _acertou = false;
  int _score = 0;
  int deckSelected = -1;
  int cardSelected = -1;
  List<String> gameActualCard;

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

  //verifica se acertou
  void setAcertou(bool oi) {
    _acertou = oi;
  }

  //vira a carta
  void flipCard() {
    _backCard = !_backCard;
    notifyListeners();
  }

  // adiciona um ponto ao score
  void addScore() {
    _score = _score + 1;
    notifyListeners();
  }

  //reseta o score
  void resetScore() {
    _score = 0;
    notifyListeners();
  }

  //confirma se a resposta esta correta
  void isCorrectAnswer() {
    _correctAnswer = !_correctAnswer;
    notifyListeners();
  }

  //devolve o nome do deck
  List<String> getDeckNames() {
    List<String> deckNames = [];
    for (int i = 0; i < _myDecks.length; i++) {
      deckNames.add(_myDecks[i].getDeckName());
    }
    return deckNames;
  }

  //retorna as faces de todas os flashcard dentro do deck. Utilizada para mostrar as faces na edicao de deck
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

  //seleciona um deck
  void selectDeck(int i) {
    deckSelected = i;
    _selectedDeck = _myDecks[i];
    saveDeck();
    notifyListeners();
  }

  // cria um novo deck
  void createNewDeck(String deckName) {
    _selectedDeck = Deck(deckName);
    deckSelected = _myDecks.length;
    saveDeck();
  }

  // selecionar uma carta ou adicionar
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

  // funcao utilizada na hora de criar um novo deck que adicionar um flashcard
  void addCard(String frontName, String backName) {
    _selectedDeck.addFlashCard(FlashCard(frontName, backName));
    saveDeck();
    notifyListeners();
  }

  // funcao utilizada na hora de criar um novo deck que remover um flashcard
  void removeCard(int index) {
    _selectedDeck.removeFlashCard(_selectedDeck.getFlashCard(index));
    notifyListeners();
  }

  // funcao utilizada na hora de editar um flashcard
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

  //devolve o nome do deck que esta sendo jogado
  String getSelectedDeckName() {
    _gameDeck = _selectedDeck;
    return _gameDeck.getDeckName();
  }

  //devolve o frontsite da carta na posicao 'num' dentro do gameDeck
  String getGameDeckCardFront(int num) {
    return _gameDeck.getFlashCard(num).getFrontSide();
  }

  //devolve o backside da carta na posicao 'num' dentro do gameDeck
  String getGameDeckCardBack(int num) {
    return _gameDeck.getFlashCard(num).getBackSide();
  }

  //remove o card do GameDeck
  void removeCardGameDeck(int num) {
    _gameDeck.removeFlashCard(_gameDeck.getFlashCard(num));
  }

  //muda as posicoes das cartas do deck aleatoriamente
  void randomCardGameDeck() {
    _gameDeck.getRandomCard();
  }

  //verifica se o gameloop tem que continuar. true  = acabou o jogo e false = continua
  bool endCheckGameLoop() {
    if (_gameDeck.getDeckSize() == 0) {
      return true;
    } else {
      return false;
    }
  }

  //save o deck na memoria temporaria
  void saveDeck() {
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
      _myDecks.add(_selectedDeck);
    }
    notifyListeners();
  }

  //remove o deck da memoria temporaria
  void removeDeck() {
    _myDecks.removeAt(deckSelected);
    notifyListeners();
  }

  //salva um arquivo do deck na plataforma utilizada
  void importDeck() async {
    _selectedDeck = await fileIO.readFileDeck("a");
    saveDeck();
  }

  //le um arquivo json e salva o deck lido na memoria temporaria
  void exportDeck() async {
    await fileIO.saveFileDeck('FlashCard', _selectedDeck);
    notifyListeners();
  }
}
