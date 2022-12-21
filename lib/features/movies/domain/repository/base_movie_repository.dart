import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';

abstract class BaseMovieRepository
{
  Future<List<Movie>>getNowPlayingMovies();

  Future<List<Movie>>getPopularMovies();

  Future<List<Movie>>getTopRatedMovies();
}