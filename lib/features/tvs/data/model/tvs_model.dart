import 'package:movies_clean_architecture/features/tvs/domain/entities/tvs.dart';

class TvsModel extends Tvs {
  const TvsModel({
    required super.id,
    required super.name,
    required super.posterPath,
    required super.overview,
    required super.voteAverage,
  });

  factory TvsModel.fromJson(Map<String, dynamic> json) {
    return TvsModel(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      voteAverage: json['vote_average'],
    );
  }
}
