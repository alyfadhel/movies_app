import 'package:dio/dio.dart';
import 'package:movies_clean_architecture/core/error/exceptions.dart';
import 'package:movies_clean_architecture/core/network/error_message_model.dart';
import 'package:movies_clean_architecture/core/util/constance.dart';
import 'package:movies_clean_architecture/features/movies/data/models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>>getUpComingMovies();
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath,);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
      .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response = await Dio().get(AppConstance.popularMoviesPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List)
      .map((e) => MovieModel.fromJson(e)));
    }else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response = await Dio().get(AppConstance.topRatedMoviesPath);
    if(response.statusCode == 200){
      return List<MovieModel>.from((response.data['results'] as List)
      .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getUpComingMovies() async{
    final response = await Dio().get(AppConstance.upComingMoviesPath);

    if(response.statusCode == 200 ){
      return List<MovieModel>.from((response.data['results'] as List)
      .map((e) => MovieModel.fromJson(e)));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
