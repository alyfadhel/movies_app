import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';

class GetTopRatesMoviesUseCase
{
  final BaseMovieRepository baseMovieRepository;

  GetTopRatesMoviesUseCase(this.baseMovieRepository);

  Future<List<Movie>>getTopRatedMovies()async
  {
    return await baseMovieRepository.getTopRatedMovies();
  }
}