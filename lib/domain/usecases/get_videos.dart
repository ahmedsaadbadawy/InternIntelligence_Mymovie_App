import 'package:dartz/dartz.dart';

import '../../Core/errors/app_error.dart';
import '../entities/video_entity.dart';
import '../repositories/movie_repository.dart';
import 'movie_params.dart';
import 'usecase.dart';

class GetVideos extends UseCase<List<VideoEntity>, MovieParams> {
  final MovieRepository repository;

  GetVideos(this.repository);

  @override
  Future<Either<AppError, List<VideoEntity>>> call(
      MovieParams params) async {
    return await repository.getVideos(params.id);
  }
}