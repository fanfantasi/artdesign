import 'dart:convert';

import 'package:artdesign/app/data/model/banner.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../../core/errors/failure.dart';

class BannerDatasource {
  Future<Either<Failure, List<ResultSlidersModel>>> banner() async {
    try {
      final jsonBanner = await rootBundle.loadString('assets/data/banner.json');

      return Right(List.from(json.decode(jsonBanner)['result'])
          .map((e) => ResultSlidersModel.fromJson(e))
          .toList());
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Terjadi sebuah kesalahan'));
    }
  }
}
