import 'package:equatable/equatable.dart';
import '/domain/entities/movie_entity.dart';

abstract class MoviePopularState extends Equatable {
  const MoviePopularState();

  @override
  List<Object?> get props => [];
}

class MoviePopularInitial extends MoviePopularState {}

class MoviePopularLoading extends MoviePopularState {}

class MoviePopularLoaded extends MoviePopularState {
  final List<MovieEntity> movies;

  const MoviePopularLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class MoviePopularError extends MoviePopularState {
  final String errorMessage;

  const MoviePopularError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}