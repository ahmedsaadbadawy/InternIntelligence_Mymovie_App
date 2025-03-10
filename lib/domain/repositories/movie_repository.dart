import 'package:dartz/dartz.dart';

import '../../Core/errors/app_error.dart';
import '../entities/cast_entity.dart';
import '../entities/movie_detail_entity.dart';
import '../entities/movie_entity.dart';
import '../entities/video_entity.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();
  Future<Either<AppError, List<MovieEntity>>> getPopular();
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity>>> getComingSoon();
  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int movieId);
  Future<Either<AppError, List<MovieEntity>>> getRecommendations(int movieId);
  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);
  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);
  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(
      String searchTerm);
}
