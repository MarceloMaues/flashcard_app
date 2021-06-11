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
