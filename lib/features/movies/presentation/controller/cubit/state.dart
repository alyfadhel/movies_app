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

class GetPopularMoviesLoadingState extends MovieStates{}

class GetPopularMoviesSuccessState extends MovieStates
{
  final List<Movie>movie;

  GetPopularMoviesSuccessState(this.movie);
}

class GetPopularMoviesErrorState extends MovieStates
{
  final String error;

  GetPopularMoviesErrorState(this.error);
}

class GetTopRatedMoviesLoadingState extends MovieStates{}

class GetTopRatedMoviesSuccessState extends MovieStates
{
  final List<Movie>movie;

  GetTopRatedMoviesSuccessState(this.movie);
}

class GetTopRatedMoviesErrorState extends MovieStates
{
  final String error;

  GetTopRatedMoviesErrorState(this.error);
}

class GetUpComingMoviesSuccessState extends MovieStates
{
  final List<Movie>movie;

  GetUpComingMoviesSuccessState(this.movie);
}

class GetUpComingMoviesErrorState extends MovieStates
{
  final String error;

  GetUpComingMoviesErrorState(this.error);
}
