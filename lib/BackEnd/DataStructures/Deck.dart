import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'dart:math';

class Deck {
  List<FlashCard> _deckCards = [];
  String _deckName = '';

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

  FlashCard getRandomCard() {
    Random random = new Random();
    int randomNumber = random.nextInt(_deckCards.length);
    return this._deckCards[randomNumber];
  }

  shuffle() {}
}
