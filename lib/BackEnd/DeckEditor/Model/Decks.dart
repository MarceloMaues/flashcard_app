//import 'dart:convert';
import 'Card.dart';

class Decks {
  //atributos
  String nameDeck;
  int cardsAmount;
  List<Card> cards;

  // Deck(this.nameDeck, this.cardsAmount, this.cards);

  //Transforma o Json em dados
  Decks.fromJson(Map<String, dynamic> json)
      : nameDeck = json['deck'],
        cardsAmount = json['cardsAmount'],
        cards = json['cards'];

  //Transforma os dados em Json (encode)
  Map<String, dynamic> toJson() => {
        'deck': nameDeck,
        'cardsAmount': cardsAmount,
        'cards': cards,
      };
}
