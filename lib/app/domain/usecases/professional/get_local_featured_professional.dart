import 'package:artdesign/app/data/model/professional.dart';
import 'package:artdesign/app/domain/repositories/featured_professional_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../../core/usecases/usecase.dart';

class GetLocalFeaturedProfessional
    implements UseCase<List<ResultProfessionalModel>, NoParams> {
  late FeaturedProfessionalRepository repository;
  GetLocalFeaturedProfessional(this.repository);

  @override
  Future<Either<Failure, List<ResultProfessionalModel>>> call(params) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return repository.featuredprofessional();
  }
}
