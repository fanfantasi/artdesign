import 'package:equatable/equatable.dart';

import '../../data/model/banner.dart';

class Sliders extends Equatable {
  final bool status;
  final ResultSlidersModel? result;
  final String message;
  const Sliders(
      {required this.status, required this.result, required this.message});

  @override
  List<Object> get props => [status, result ?? '', message];
}

class ResultSliders extends Equatable {
  final int? id;
  final String? title;
  final String? subtitle;
  final int? type;
  final String? button;
  final String? desc;
  final String? image;
  const ResultSliders(
      {this.id,
      this.title,
      this.subtitle,
      this.type,
      this.button,
      this.desc,
      this.image});

  @override
  List<Object> get props =>
      [id!, title!, subtitle!, type!, button!, desc!, image!];
}
