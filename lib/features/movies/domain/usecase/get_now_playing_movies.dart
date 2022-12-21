import 'package:dartz/dartz.dart';
import 'package:movies_clean_architecture/core/error/failure.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';

class GetNowPlayingMoviesUseCase
{
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Movie>>>execute()async
  {
    return await baseMovieRepository.getNowPlayingMovies();
  }
}