import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String? originalTitle;
  final String? mediaType;
  final bool? adult;
  final String? originalLanguage;
  final List<int>? genreIds;
  final double? popularity;
  final bool? video;
  final int? voteCount;

  const MovieModel({
    String? posterPath,
    int? id,
    String? backdropPath,
    String? title,
    this.originalTitle,
    String? overview,
    this.mediaType,
    this.adult,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    String? releaseDate,
    this.video,
    double? voteAverage,
    this.voteCount,
  }) : super(
          posterPath: posterPath ?? '',
          id: id ?? 0,
          backdropPath: backdropPath ?? '',
          title: title ?? '',
          voteAverage: voteAverage ?? 0,
          releaseDate: releaseDate ?? '',
          overview: overview,
        );

  // Factory constructor to create a MovieModel from JSON
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      adult: json['adult'],
      originalLanguage: json['original_language'],
      genreIds: json['genre_ids'].cast<int>(),
      popularity: json['popularity']?.toDouble()??0.0,
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble()??0.0,
      voteCount: json['vote_count'],
    );
  }

  // Method to convert MovieModel to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['title'] = title;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['original_language'] = originalLanguage;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}