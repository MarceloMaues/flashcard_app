import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'dart:math';

class Deck {
  //atributos do deck
  List<FlashCard> _deckCards = [];
  String _deckName = '';

  //construtor
  Deck(String name) {
    this._deckName = name;
  }
  void setDeckName(String name) {
    this._deckName = name;
  }

  String getDeckName() {
    return this._deckName;
  }

  int getDeckSize() {
    return _deckCards.length;
  }

  void renameDeck(String name) {
    this._deckName = name;
  }

  FlashCard getFlashCard(int local) {
    return this._deckCards[local];
  }

  FlashCard setFlashCard(int local, String front, String back) {
    this._deckCards[local].setBackSide(back);
    this._deckCards[local].setFrontSide(front);
  }

  void addFlashCard(FlashCard card) {
    this._deckCards.add(card);
  }

  void addFlashCardString(String front, String back) {
    FlashCard card = new FlashCard(back, front);
    this._deckCards.add(card);
  }

  void removeFlashCard(FlashCard card) {
    this._deckCards.remove(card);
  }

  void getRandomCard() {
    FlashCard inicio = _deckCards[0];
    Random random = new Random();
    int randomNumber = random.nextInt(_deckCards.length);
    _deckCards[0] = _deckCards[randomNumber];
    this._deckCards[randomNumber] = inicio;
  }

  List<String> getFirstCardAsSting() {
    List<String> faces = [];
    faces.add(_deckCards[0].getFrontSide());
    faces.add(_deckCards[0].getBackSide());
    faces.removeAt(0);
    return faces;
  }
}
