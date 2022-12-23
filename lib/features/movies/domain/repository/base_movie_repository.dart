import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository
{
  Future<Either<Failure,List<Movie>>>getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>>getPopularMovies();

  Future<Either<Failure,List<Movie>>>getTopRatedMovies();
  
  Future<Either<Failure,List<Movie>>>getUpComingMovies();
}