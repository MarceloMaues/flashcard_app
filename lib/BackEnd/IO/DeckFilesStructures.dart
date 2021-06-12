class NameDecks {
  List<String> nameDeck;

  NameDecks(this.nameDeck);

  NameDecks.fromJson(Map<String, dynamic> json)
      : nameDeck = json['nameDeck'].cast<String>();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nameDeck'] = this.nameDeck;
    return data;
  }
}

class Card {
  //atributos
  String frontSide;
  String backSide;

  Card(this.frontSide, this.backSide);

  //Transforma o Json em dados
  Card.fromJson(Map<String, dynamic> json)
      : frontSide = json['front'],
        backSide = json['back'];

  //Transforma os dados em Json (encode)
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['front'] = this.frontSide;
    data['back'] = this.backSide;
    return data;
  }
}

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