import 'package:get_it/get_it.dart';
import 'package:movies_clean_architecture/features/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_clean_architecture/features/movies/data/repository/movie_repository.dart';
import 'package:movies_clean_architecture/features/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_polpular_movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_up_coming_movies_use_case.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/cubit.dart';
import 'package:movies_clean_architecture/features/tvs/data/datasource/base_tvs_remote_data_source.dart';
import 'package:movies_clean_architecture/features/tvs/data/repository/tvs_repository.dart';
import 'package:movies_clean_architecture/features/tvs/domain/repository/base_tvs_repository.dart';
import 'package:movies_clean_architecture/features/tvs/domain/usecase/get_on_the_air_use_case.dart';
import 'package:movies_clean_architecture/features/tvs/domain/usecase/get_popular_tvs_use_case.dart';
import 'package:movies_clean_architecture/features/tvs/domain/usecase/get_top_rated_tvs_use_case.dart';
import 'package:movies_clean_architecture/features/tvs/presentation/controller/cubit/cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    // Movies //////////////////////////////////////////////
    sl.registerFactory(
      () => MovieCubit(
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatesMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetUpComingMoviesUseCase(sl()));
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());

    // Tvs /////////////////////////////////////

    sl.registerFactory(
      () => TvsCubit(
        sl(),
        sl(),
        sl(),
      ),
    );
    sl.registerLazySingleton(() => GetOnTheAirUseCase(sl()));
    sl.registerFactory(() => GetPopularTvsUseCase(sl()));
    sl.registerFactory(() => GetTopRateTvsUseCase(sl()));
    sl.registerLazySingleton<BaseTvsRepository>(() => TvsRepository(sl()));
    sl.registerLazySingleton<BaseTvsRemoteDataSource>(
        () => TvsRemoteDataSource());
  }
}
