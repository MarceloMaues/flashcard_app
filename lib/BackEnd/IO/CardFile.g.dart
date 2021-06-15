// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CardFile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardFile _$CardFileFromJson(Map<String, dynamic> json) {
  return CardFile(
    json['front'] as String,
    json['back'] as String,
  );
}

Map<String, dynamic> _$CardFileToJson(CardFile instance) => <String, dynamic>{
      'front': instance.front,
      'back': instance.back,
    };
