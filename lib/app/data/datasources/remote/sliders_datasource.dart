import 'package:artdesign/app/core/errors/failure.dart';
import 'package:artdesign/app/data/api/api.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../model/banner.dart';

class SlidersRemoteDatasource {
  final RestClient client;
  SlidersRemoteDatasource({required this.client});

  Future<Either<Failure, List<ResultSlidersModel>>> slidersRemote() async {
    try {
      final category = await client.sliders();
      if (!category['status']) {
        return Left(Failure(category['message']));
      } else {
        return Right(List.from(category['result'])
            .map((e) => ResultSlidersModel.fromJson(e))
            .toList());
      }
    } on DioError catch (error) {
      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('Data sliders retrieved unsuccessfully'));
    }
  }
}
