import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/features/tvs/domain/entities/tvs.dart';

abstract class BaseTvsRepository
{
  Future<Either<Failure,List<Tvs>>>getOnTheAirTvs();
  Future<Either<Failure,List<Tvs>>>getPopularTvs();
}