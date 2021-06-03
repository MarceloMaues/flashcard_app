import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'dart:math';

class Deck{

  List<FlashCard>? _deckCards = null;
  String _deckName = '';

  Deck(String name){
      this._deckName=name;
  }
  void setDeckName(String name){
    this._deckName = name;
  }

  String getDeckName(){
    return this._deckName;
  }

  int getDeckSize(){
    int size = 0;
    if(_deckCards!=null){
      size = _deckCards!.length;
    }
    return size;
  }

  void renameDeck(String name){
    this._deckName=name;
  }

  FlashCard getFlashCard(int local){
    return this._deckCards![local];
  }

  void addFlashCard(FlashCard card){
    this._deckCards!.add(card);
  }

  void removeFlashCard(FlashCard card){
    this._deckCards!.remove(card);
  }

  FlashCard getRandomCard(){
    Random random = new Random();
    int randomNumber = random.nextInt(_deckCards!.length);
    return this._deckCards![randomNumber];
  }

  sortDeck(){

  }
}