import 'package:artdesign/app/data/model/projects.dart';
import 'package:equatable/equatable.dart';

class Projects extends Equatable {
  final bool status;
  final ResultProjectsModel? result;
  final String message;
  const Projects(
      {required this.status, required this.result, required this.message});

  @override
  List<Object> get props => [status, result ?? '', message];
}

class ResultProjects extends Equatable {
  final int? id;
  final int? professionalid;
  final String? professional;
  final String? logo;
  final String? title;
  final String? desc;
  final ResultDetailProjectsModel? detailProject;
  final ResultImageProjectsModel? imageProject;
  const ResultProjects(
      {this.id,
      this.professionalid,
      this.professional,
      this.logo,
      this.title,
      this.desc,
      this.detailProject,
      this.imageProject});

  @override
  List<Object> get props => [
        id!,
        professionalid!,
        professional!,
        title!,
        desc!,
        detailProject!,
        imageProject!
      ];
}

class ResultDetailProject extends Equatable {
  final String? type;
  final String? size;
  final String? design;
  final String? architect;
  final String? location;
  final String? status;
  const ResultDetailProject(
      {this.type,
      this.size,
      this.design,
      this.architect,
      this.location,
      this.status});

  @override
  List<Object> get props =>
      [type!, size!, design!, architect!, location!, status!];
}

class ResultImageProject extends Equatable {
  final String? thumbnail;
  final List<String>? image;
  const ResultImageProject({this.thumbnail, this.image});

  @override
  List<Object> get props => [thumbnail!, image!];
}
