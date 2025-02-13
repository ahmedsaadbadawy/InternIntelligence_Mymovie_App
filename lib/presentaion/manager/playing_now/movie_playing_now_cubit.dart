import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/no_params.dart';
import '/domain/usecases/get_playing_now.dart';

import 'movie_playing_now_state.dart';

class MoviePlayingNowCubit extends Cubit<MoviePlayingNowState> {
  final GetPlayingNow getPlayingNow;

  MoviePlayingNowCubit({required this.getPlayingNow}) : super(MoviePlayingNowInitial());

  Future<void> loadPlayingNow() async {
    emit(MoviePlayingNowLoading());
    final moviesEither = await getPlayingNow(NoParams());
    moviesEither.fold(
      (failure) => emit(MoviePlayingNowError(errorMessage: failure.toString())),
      (movies) => emit(MoviePlayingNowLoaded(movies: movies)),
    );
  }
}