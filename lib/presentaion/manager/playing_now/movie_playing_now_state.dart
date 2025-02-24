import 'package:equatable/equatable.dart';
import '/domain/entities/movie_entity.dart';

abstract class MoviePlayingNowState extends Equatable {
  const MoviePlayingNowState();

  @override
  List<Object?> get props => [];
}

class MoviePlayingNowInitial extends MoviePlayingNowState {}

class MoviePlayingNowLoading extends MoviePlayingNowState {}

class MoviePlayingNowLoaded extends MoviePlayingNowState {
  final List<MovieEntity> movies;

  const MoviePlayingNowLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class MoviePlayingNowError extends MoviePlayingNowState {
  final String errorMessage;

  const MoviePlayingNowError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}