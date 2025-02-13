import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/no_params.dart';
import '/domain/usecases/get_trending.dart';

import 'movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  final GetTrending getTrending;

  MovieCarouselCubit({required this.getTrending}) : super(MovieCarouselInitial());

  Future<void> loadCarousel() async {
    emit(MovieCarouselLoading());
    final moviesEither = await getTrending(NoParams());
    moviesEither.fold(
      (failure) => emit(MovieCarouselError(errorMessage: failure.message)),
      (movies) => emit(MovieCarouselLoaded(movies: movies)),
    );
  }
}