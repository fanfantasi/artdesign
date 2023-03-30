import 'package:artdesign/app/domain/entities/event.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class EventModel extends Event {
  const EventModel(
      {required bool status,
      required ResultEventModel? result,
      required String message})
      : super(status: status, result: result, message: message);

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultEventModel extends ResultEvent {
  const ResultEventModel(
      {int? id, String? title, String? date, String? desc, String? image})
      : super(id: id, title: title, date: date, desc: desc, image: image);

  factory ResultEventModel.fromJson(Map<String, dynamic> json) =>
      _$ResultEventModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultEventModelToJson(this);
}
