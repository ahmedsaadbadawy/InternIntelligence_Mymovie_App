import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/usecases/search_params.dart';
import '../../Core/errors/app_error.dart';
import '/domain/entities/movie_entity.dart';
import '/domain/repositories/movie_repository.dart';
import '/domain/usecases/usecase.dart';

class SearchMovies extends UseCase<List<MovieEntity>, SearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      SearchParams params) async {
    return await repository.getSearchedMovies(params.searchText);
  }
}