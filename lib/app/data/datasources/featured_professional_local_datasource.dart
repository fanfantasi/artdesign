import 'dart:convert';

import 'package:artdesign/app/data/model/professional.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../core/errors/failure.dart';

class FeaturedProfessionalDatasource {
  Future<Either<Failure, List<ResultProfessionalModel>>> professional() async {
    try {
      final jsonBanner =
          await rootBundle.loadString('assets/data/featuredprofessional.json');

      return Right(List.from(json.decode(jsonBanner)['result'])
          .map((e) => ResultProfessionalModel.fromJson(e))
          .toList());
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
