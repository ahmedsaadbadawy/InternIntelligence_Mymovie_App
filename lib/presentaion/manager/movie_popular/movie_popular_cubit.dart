import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/no_params.dart';
import '/domain/usecases/get_popular.dart';

import 'movie_popular_state.dart';

class MoviePopularCubit extends Cubit<MoviePopularState> {
  final GetPopular getPopular;

  MoviePopularCubit({required this.getPopular}) : super(MoviePopularInitial());

  Future<void> loadPopular() async {
    emit(MoviePopularLoading());
    final moviesEither = await getPopular(NoParams());
    moviesEither.fold(
      (failure) => emit(MoviePopularError(errorMessage: failure.toString())),
      (movies) => emit(MoviePopularLoaded(movies: movies)),
    );
  }
}