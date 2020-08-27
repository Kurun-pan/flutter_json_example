import 'package:json_annotation/json_annotation.dart';
part 'sample.g.dart';

@JsonSerializable()
class SampleModel {
  SampleModel({this.id, this.name});
  String id;
  String name;

  factory SampleModel.fromJson(Map<String, dynamic> json) =>
      _$SampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SampleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Samples {
  List<SampleModel> list = [];
  Samples(this.list);

  factory Samples.fromJson(Map<String, dynamic> json) =>
      _$SamplesFromJson(json);

  Map<String, dynamic> toJson() => _$SamplesToJson(this);
}
