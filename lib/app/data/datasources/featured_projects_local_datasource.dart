import 'dart:convert';

import 'package:artdesign/app/data/model/projects.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../core/errors/failure.dart';

class FeaturedProjectsDatasource {
  Future<Either<Failure, List<ResultProjectsModel>>> featuredprojects() async {
    try {
      final jsonBanner =
          await rootBundle.loadString('assets/data/featuredprojects.json');

      return Right(List.from(json.decode(jsonBanner)['result'])
          .map((e) => ResultProjectsModel.fromJson(e))
          .toList());
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
