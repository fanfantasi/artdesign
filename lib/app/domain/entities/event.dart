import 'package:equatable/equatable.dart';

import '../../data/model/event.dart';

class Event extends Equatable {
  final bool status;
  final ResultEventModel? result;
  final String message;
  const Event(
      {required this.status, required this.result, required this.message});

  @override
  List<Object> get props => [status, result ?? '', message];
}

class ResultEvent extends Equatable {
  final int? id;
  final String? title;
  final String? date;
  final String? desc;
  final String? image;
  const ResultEvent({this.id, this.title, this.date, this.desc, this.image});

  @override
  List<Object> get props => [id!, title!, date!, desc!, image!];
}
