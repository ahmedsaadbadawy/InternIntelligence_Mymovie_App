import 'package:equatable/equatable.dart';
import '/domain/entities/movie_entity.dart';

abstract class MovieComingSoonState extends Equatable {
  const MovieComingSoonState();

  @override
  List<Object?> get props => [];
}

class MovieComingSoonInitial extends MovieComingSoonState {}

class MovieComingSoonLoading extends MovieComingSoonState {}

class MovieComingSoonLoaded extends MovieComingSoonState {
  final List<MovieEntity> movies;

  const MovieComingSoonLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class MovieComingSoonError extends MovieComingSoonState {
  final String errorMessage;

  const MovieComingSoonError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}