import 'package:json_annotation/json_annotation.dart';
part 'CardFile.g.dart';

@JsonSerializable(explicitToJson: true)
///Classe de mapeamento do FlashCard para Json e vice versa
class CardFile {
  String front;
  String back;
  CardFile(this.front, this.back);

  factory CardFile.fromJson(Map<String, dynamic> json) =>
      _$CardFileFromJson(json);

  Map<String, dynamic> toJson() => _$CardFileToJson(this);
}
