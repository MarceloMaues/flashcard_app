// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeckTest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckTest _$DeckTestFromJson(Map<String, dynamic> json) {
  return DeckTest(
    json['name'] as String,
    json['numCards'] as int,
    (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : CardTest.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeckTestToJson(DeckTest instance) => <String, dynamic>{
      'name': instance.name,
      'numCards': instance.numCards,
      'cards': instance.cards,
    };
