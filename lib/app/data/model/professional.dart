import 'package:artdesign/app/domain/entities/professional.dart';
import 'package:json_annotation/json_annotation.dart';

part 'professional.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProfessionalModel extends Professional {
  const ProfessionalModel(
      {required bool status,
      required ResultProfessionalModel? result,
      required String message})
      : super(status: status, result: result, message: message);

  factory ProfessionalModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfessionalModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultProfessionalModel extends ResultProfessional {
  const ResultProfessionalModel(
      {int? id,
      String? title,
      int? categoryid,
      String? category,
      String? city,
      String? location,
      String? phone,
      String? website,
      String? instagram,
      String? whatsapp,
      String? logo,
      String? background,
      String? about})
      : super(
            id: id,
            title: title,
            categoryid: categoryid,
            category: category,
            city: city,
            location: location,
            phone: phone,
            website: website,
            instagram: instagram,
            whatsapp: whatsapp,
            logo: logo,
            background: background,
            about: about);

  factory ResultProfessionalModel.fromJson(Map<String, dynamic> json) =>
      _$ResultProfessionalModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultProfessionalModelToJson(this);
}
