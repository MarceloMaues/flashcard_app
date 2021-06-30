import 'package:flashcard_app/BackEnd/DataStructures/FlashCard.dart';
import 'dart:math';
///Classe que define  um deck
class Deck {
  ///Atributos do deck
  List<FlashCard> _deckCards = [];
  String _deckName = '';

  ///Construtor
  Deck(String name) {
    this._deckName = name;
  }

  ///Define o nome do deck
  void setDeckName(String name) {
    this._deckName = name;
  }

  ///Pega o nome do Deck
  String getDeckName() {
    return this._deckName;
  }

  ///Pega a quantidade de cards no Deck
  int getDeckSize() {
    return _deckCards.length;
  }

  ///Renomeia o deck
  void renameDeck(String name) {
    this._deckName = name;
  }


  ///Pega o FlashCard na posição local
  FlashCard getFlashCard(int local) {
    return this._deckCards[local];
  }

  ///Redefine um FlashCard no deck
  FlashCard setFlashCard(int local, String front, String back) {
    this._deckCards[local].setBackSide(back);
    this._deckCards[local].setFrontSide(front);
  }

  ///Adiciona no final do deck um novo FlashCard
  void addFlashCard(FlashCard card) {
    this._deckCards.add(card);
  }

  ///Adiciona no final do deck um novo FlashCard com variaveis primitivas
  void addFlashCardString(String front, String back) {
    FlashCard card = new FlashCard(back, front);
    this._deckCards.add(card);
  }

  ///Exclui um flashcard em uma posição especifica
  void removeFlashCard(FlashCard card) {
    this._deckCards.remove(card);
  }

  ///Troca o primeiro card com um aleátório
  void getRandomCard() {
    FlashCard inicio = _deckCards[0];
    Random random = new Random();
    int randomNumber = random.nextInt(_deckCards.length);
    _deckCards[0] = _deckCards[randomNumber];
    this._deckCards[randomNumber] = inicio;
  }

  ///Pega o primeiro card do deck
  List<String> getFirstCardAsSting() {
    List<String> faces = [];
    faces.add(_deckCards[0].getFrontSide());
    faces.add(_deckCards[0].getBackSide());
    faces.removeAt(0);
    return faces;
  }

  ///Faz uma copia de um deck em outra variavel deck
  void copyDeckFrom(Deck deck){
    int cardsAmount = deck.getDeckSize();
    this._deckName = deck.getDeckName();
    for(int i = 0;i<cardsAmount;i++){
      this._deckCards.add(new FlashCard(deck.getFlashCard(i).getBackSide(),deck.getFlashCard(i).getFrontSide()));
    }
  }
}
