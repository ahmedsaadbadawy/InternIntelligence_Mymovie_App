import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/no_params.dart';
import '/domain/usecases/get_coming_soon.dart';

import 'movie_coming_soon_state.dart';

class MovieComingSoonCubit extends Cubit<MovieComingSoonState> {
  final GetComingSoon getComingSoon;

  MovieComingSoonCubit({required this.getComingSoon}) : super(MovieComingSoonInitial());

  Future<void> loadComingSoon() async {
    emit(MovieComingSoonLoading());
    final moviesEither = await getComingSoon(NoParams());
    moviesEither.fold(
      (failure) => emit(MovieComingSoonError(errorMessage: failure.toString())),
      (movies) => emit(MovieComingSoonLoaded(movies: movies)),
    );
  }
}