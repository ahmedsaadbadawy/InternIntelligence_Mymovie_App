import 'package:dartz/dartz.dart';
import '../../Core/errors/app_error.dart';
import '/domain/entities/movie_detail_entity.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';
import 'movie_params.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams params) async {
    return await repository.getMovieDetail(params.id);
  }
}