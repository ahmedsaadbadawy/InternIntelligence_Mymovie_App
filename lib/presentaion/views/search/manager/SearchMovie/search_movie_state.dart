import 'package:equatable/equatable.dart';
import '../../../../../domain/entities/movie_entity.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object?> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<MovieEntity> movies;

  const SearchMoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class SearchMoviesError extends SearchMoviesState {
  final String errorMessage;

  const SearchMoviesError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
