import 'package:dartz/dartz.dart';
import '../../Core/errors/app_error.dart';
import 'no_params.dart';
import '/domain/entities/movie_entity.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

class GetComingSoon extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetComingSoon(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getComingSoon();
  }
}