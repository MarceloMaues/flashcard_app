// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DeckFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckFile _$DeckFileFromJson(Map<String, dynamic> json) {
  return DeckFile(
    json['name'] as String,
    json['numCards'] as int,
    (json['cards'] as List)
        ?.map((e) =>
            e == null ? null : CardFile.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DeckFileToJson(DeckFile instance) => <String, dynamic>{
      'name': instance.name,
      'numCards': instance.numCards,
      'cards': instance.cards,
    };
