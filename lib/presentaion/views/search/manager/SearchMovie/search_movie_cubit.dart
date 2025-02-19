import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/search_movies.dart';
import 'package:movie_app/domain/usecases/search_params.dart';
import 'search_movie_state.dart';

class SearchMoviesCubit extends Cubit<SearchMoviesState> {
  final SearchMovies searchMovies;

  SearchMoviesCubit({
    required this.searchMovies,
  }) : super(SearchMoviesInitial());

  Future<void> searchForMovies(String searchText) async {
    emit(SearchMoviesLoading());

    final eitherResponse = await searchMovies(
      SearchParams(searchText: searchText),
    );

    eitherResponse.fold(
      (failure) => emit(SearchMoviesError(
        errorMessage: failure.message,
      )),
      (movies) => emit(SearchMoviesLoaded(movies)),
    );
  }
}
