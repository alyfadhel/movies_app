import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/exceptions.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/features/tvs/data/datasource/base_tvs_remote_data_source.dart';
import 'package:movies_clean_architecture/features/tvs/domain/entities/tvs.dart';
import 'package:movies_clean_architecture/features/tvs/domain/repository/base_tvs_repository.dart';

class TvsRepository extends BaseTvsRepository
{
  final BaseTvsRemoteDataSource baseTvsRemoteDataSource;

  TvsRepository(this.baseTvsRemoteDataSource);
  @override
  Future<Either<Failure, List<Tvs>>> getOnTheAirTvs() async{
    final result = await baseTvsRemoteDataSource.getOnTheAir();

    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tvs>>> getPopularTvs() async{
    final result = await baseTvsRemoteDataSource.getPopularTvs();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

}