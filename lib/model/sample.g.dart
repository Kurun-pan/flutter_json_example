// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SampleModel _$SampleModelFromJson(Map<String, dynamic> json) {
  return SampleModel(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$SampleModelToJson(SampleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Samples _$SamplesFromJson(Map<String, dynamic> json) {
  return Samples(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : SampleModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SamplesToJson(Samples instance) => <String, dynamic>{
      'list': instance.list?.map((e) => e?.toJson())?.toList(),
    };
