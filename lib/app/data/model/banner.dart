import 'package:artdesign/app/domain/entities/banner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class SlidersModel extends Sliders {
  const SlidersModel(
      {required bool status,
      required ResultSlidersModel? result,
      required String message})
      : super(status: status, result: result, message: message);

  factory SlidersModel.fromJson(Map<String, dynamic> json) =>
      _$SlidersModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlidersModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultSlidersModel extends ResultSliders {
  const ResultSlidersModel(
      {int? id,
      String? title,
      String? subtitle,
      int? type,
      String? button,
      String? desc,
      String? image})
      : super(
            id: id,
            title: title,
            subtitle: subtitle,
            type: type,
            button: button,
            desc: desc,
            image: image);

  factory ResultSlidersModel.fromJson(Map<String, dynamic> json) =>
      _$ResultSlidersModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultSlidersModelToJson(this);
}
