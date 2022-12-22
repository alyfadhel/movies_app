import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';

abstract class MovieStates{}

class InitialMovieState extends MovieStates{}

class GetNowPlayingMoviesLoadingState extends MovieStates{}

class GetNowPlayingMoviesSuccessState extends MovieStates
{
  final List<Movie>movie;

  GetNowPlayingMoviesSuccessState(this.movie);
}

class GetNowPlayingMoviesErrorState extends MovieStates
{
  final String error;

  GetNowPlayingMoviesErrorState(this.error);
}
