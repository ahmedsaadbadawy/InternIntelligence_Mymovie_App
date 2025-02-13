import 'package:equatable/equatable.dart';
import '/domain/entities/movie_entity.dart';

abstract class MovieCarouselState extends Equatable {
  const MovieCarouselState();

  @override
  List<Object?> get props => [];
}

class MovieCarouselInitial extends MovieCarouselState {}

class MovieCarouselLoading extends MovieCarouselState {}

class MovieCarouselLoaded extends MovieCarouselState {
  final List<MovieEntity> movies;

  const MovieCarouselLoaded({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class MovieCarouselError extends MovieCarouselState {
  final String errorMessage;

  const MovieCarouselError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}