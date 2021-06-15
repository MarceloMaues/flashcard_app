import 'package:json_annotation/json_annotation.dart';
import 'package:flashcard_app/BackEnd/IO/CardFile.dart';
part 'DeckFile.g.dart';

@JsonSerializable()
class DeckFile {
  String name;
  int numCards;
  List<CardFile> cards;
  DeckFile(this.name, this.numCards, this.cards);
  factory DeckFile.fromJson(Map<String, dynamic> json) =>
      _$DeckFileFromJson(json);

  Map<String, dynamic> toJson() => _$DeckFileToJson(this);
}
