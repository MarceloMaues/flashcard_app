import 'package:json_annotation/json_annotation.dart';
import 'package:flashcard_app/BackEnd/IO/CardTest.dart';
part 'DeckTest.g.dart';

@JsonSerializable()
class DeckTest {
  String name;
  int numCards;
  List<CardTest> cards;
  DeckTest(this.name, this.numCards, this.cards);
  factory DeckTest.fromJson(Map<String, dynamic> json) =>
      _$DeckTestFromJson(json);

  Map<String, dynamic> toJson() => _$DeckTestToJson(this);
}
