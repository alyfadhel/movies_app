import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/core/usecase/bas_usecase.dart';
import 'package:movies_clean_architecture/features/tvs/domain/entities/tvs.dart';
import 'package:movies_clean_architecture/features/tvs/domain/repository/base_tvs_repository.dart';

class GetTopRateTvsUseCase extends BaseMovieUseCase<List<Tvs>,NoParameters>
{
  final BaseTvsRepository baseTvsRepository;

  GetTopRateTvsUseCase(this.baseTvsRepository);
  @override
  Future<Either<Failure, List<Tvs>>> call(NoParameters parameters)async {
    return await baseTvsRepository.getTopRatedTvs();
  }

}