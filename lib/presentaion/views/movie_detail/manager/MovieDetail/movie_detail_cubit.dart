import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../../Core/errors/app_error.dart';
import '../../../../../domain/usecases/movie_params.dart';
import '/domain/entities/movie_detail_entity.dart';
import '/domain/usecases/get_movie_detail.dart';
import 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailCubit({
    required this.getMovieDetail,
  }) : super(MovieDetailInitial());

  Future<void> loadMovieDetail(int movieId) async {
    emit(MovieDetailLoading());

    final Either<AppError, MovieDetailEntity> eitherResponse =
        await getMovieDetail(
      MovieParams(movieId),
    );

    eitherResponse.fold(
      (failure) => emit(MovieDetailError()),
      (movieDetail) => emit(MovieDetailLoaded(movieDetail)),
    );
  }
}