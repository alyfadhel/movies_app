import 'package:equatable/equatable.dart';

class Movie extends Equatable
{
  final int id;
  final String title;
  final String backdropPath;
  final String posterPath;
  final List<int>genreIds;
  final String overview;
  final String releaseDate;
  final dynamic voteAverage;


 const Movie(
     {
       required this.id,
       required this.title,
       required this.backdropPath,
       required this.posterPath,
       required this.genreIds,
       required this.overview,
       required this.releaseDate,
       required this.voteAverage,
     });

  @override
  List<Object?> get props => [
    id,
    title,
    backdropPath,
    posterPath,
    genreIds,
    overview,
    releaseDate,
    override,
  ];

}