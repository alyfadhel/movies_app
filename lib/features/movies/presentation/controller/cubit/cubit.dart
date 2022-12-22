import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_clean_architecture/core/usecase/bas_usecase.dart';
import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_clean_architecture/features/movies/domain/usecase/get_polpular_movies.dart';
import 'package:movies_clean_architecture/features/movies/presentation/controller/cubit/state.dart';

class MovieCubit extends Cubit<MovieStates> {
  List<Movie> movie = [];
  final GetNowPlayingMoviesUseCase getNowPlayingMovieUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;

  MovieCubit(
    this.getNowPlayingMovieUseCase,
    this.getPopularMoviesUseCase,
  ) : super(InitialMovieState());

  static MovieCubit get(context) => BlocProvider.of(context);

  void getNowPlayingMovie() async {
    emit(GetNowPlayingMoviesLoadingState());

    final result = await getNowPlayingMovieUseCase(const NoParameters());

    result.fold((l) => emit(GetNowPlayingMoviesErrorState(l.toString())), (r) {
      movie = r;
      print(result.toString());
      emit(GetNowPlayingMoviesSuccessState(r));
    });
  }

  void getPopularMovie()async
  {
    emit(GetPopularMoviesLoadingState());
    final result = await getPopularMoviesUseCase(const NoParameters());

    result.fold(
            (l) => emit(GetPopularMoviesErrorState(l.message)),
            (r) {
              movie = r;
              emit(GetPopularMoviesSuccessState(r));
            } ,
    );
  }
}
