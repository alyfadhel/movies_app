import 'package:movies_clean_architecture/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie
{
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.posterPath,
    required super.genreIds,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
  });

  factory MovieModel.fromJson(Map<String,dynamic>json)
  {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'],
    );
  }



}