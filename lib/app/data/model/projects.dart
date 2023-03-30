import 'package:artdesign/app/domain/entities/projects.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projects.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class ProjectsModel extends Projects {
  const ProjectsModel(
      {required bool status,
      required ResultProjectsModel? result,
      required String message})
      : super(status: status, result: result, message: message);

  factory ProjectsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultProjectsModel extends ResultProjects {
  const ResultProjectsModel({
    int? id,
    int? professionalid,
    String? professional,
    String? logo,
    String? title,
    String? desc,
    ResultDetailProjectsModel? detailProject,
    ResultImageProjectsModel? imageProject,
  }) : super(
            id: id,
            professionalid: professionalid,
            professional: professional,
            logo: logo,
            title: title,
            desc: desc,
            detailProject: detailProject,
            imageProject: imageProject);

  factory ResultProjectsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultProjectsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultProjectsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultDetailProjectsModel extends ResultDetailProject {
  const ResultDetailProjectsModel({
    String? type,
    String? size,
    String? design,
    String? architect,
    String? location,
    String? status,
  }) : super(
            type: type,
            size: size,
            design: design,
            architect: architect,
            location: location,
            status: status);

  factory ResultDetailProjectsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultDetailProjectsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultDetailProjectsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultImageProjectsModel extends ResultImageProject {
  const ResultImageProjectsModel({
    String? thumbnail,
    List<String>? image,
  }) : super(thumbnail: thumbnail, image: image);

  factory ResultImageProjectsModel.fromJson(Map<String, dynamic> json) =>
      _$ResultImageProjectsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResultImageProjectsModelToJson(this);
}
