import 'package:dartz/dartz.dart';
import '../../Core/errors/app_error.dart';
import '../entities/movie_entity.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';
import 'movie_params.dart';

class GetMovieDetail extends UseCase<List<MovieEntity>, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieParams params) async {
    return await repository.getRecommendations(params.id);
  }
}