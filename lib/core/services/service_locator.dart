
import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_architecture/features/movies/data/repository/movie_repository.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_polpular_movies.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/cubit.dart';

final sl = GetIt.instance;

class ServiceLocator
{
  Future <void> init()async
  {
    sl.registerFactory(() => MovieCubit(sl(),sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}