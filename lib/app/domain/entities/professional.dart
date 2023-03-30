import 'package:equatable/equatable.dart';

import '../../data/model/professional.dart';

class Professional extends Equatable {
  final bool status;
  final ResultProfessionalModel? result;
  final String message;
  const Professional(
      {required this.status, required this.result, required this.message});

  @override
  List<Object> get props => [status, result ?? '', message];
}

class ResultProfessional extends Equatable {
  final int? id;
  final String? title;
  final int? categoryid;
  final String? category;
  final String? city;
  final String? location;
  final String? phone;
  final String? website;
  final String? instagram;
  final String? whatsapp;
  final String? logo;
  final String? background;
  final String? about;
  const ResultProfessional(
      {this.id,
      this.title,
      this.categoryid,
      this.category,
      this.city,
      this.location,
      this.phone,
      this.website,
      this.instagram,
      this.whatsapp,
      this.logo,
      this.background,
      this.about});

  @override
  List<Object> get props => [
        id!,
        title!,
        categoryid!,
        category!,
        city!,
        location!,
        phone!,
        website!,
        instagram!,
        whatsapp!,
        logo!,
        background!,
        about!
      ];
}
