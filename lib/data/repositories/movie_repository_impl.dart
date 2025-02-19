import 'package:dartz/dartz.dart';
import '../../Core/errors/app_error.dart';
import '../datasources/movie_remote_data_source.dart';
import '../models/movie_detail_model.dart';
import '/data/models/movie_model.dart';
import '/domain/entities/movie_entity.dart';
import '/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int movieId) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(movieId);
      return Right(movie);
    } on Exception {
      return const Left( AppError('Something went wrong'));
    }
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> getRecommendations(int movieId) async{
    try {
      final movies = await remoteDataSource.getRecommendations(movieId);
      return Right(movies);
    } on Exception {
      return const Left( AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getSearchedMovies(
      String searchTerm) async {
    try {
      final movies = await remoteDataSource.getSearchedMovies(searchTerm);
      return Right(movies);
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }
}
