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
