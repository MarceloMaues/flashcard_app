import 'package:json_annotation/json_annotation.dart';
part 'CardTest.g.dart';

@JsonSerializable(
    explicitToJson:true
)
class CardTest {
  String front;
  String back;
  CardTest(this.front, this.back);

  factory CardTest.fromJson(Map<String, dynamic> json) =>
      _$CardTestFromJson(json);

  Map<String, dynamic> toJson() => _$CardTestToJson(this);
}
