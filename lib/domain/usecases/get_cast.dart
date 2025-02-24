import 'package:dartz/dartz.dart';

import '../../Core/errors/app_error.dart';
import '../entities/cast_entity.dart';
import '../repositories/movie_repository.dart';
import 'movie_params.dart';
import 'usecase.dart';

class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast(this.repository);

  @override
  Future<Either<AppError, List<CastEntity>>> call(
      MovieParams params) async {
    return await repository.getCastCrew(params.id);
  }
}
