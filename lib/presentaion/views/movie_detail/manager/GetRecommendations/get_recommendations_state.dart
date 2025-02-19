import 'package:equatable/equatable.dart';
import '../../../../../domain/entities/movie_entity.dart';

abstract class GetRecommendationsState extends Equatable {
  const GetRecommendationsState();

  @override
  List<Object?> get props => [];
}

class GetRecommendationsInitial extends GetRecommendationsState {}

class GetRecommendationsLoading extends GetRecommendationsState {}

class GetRecommendationsLoaded extends GetRecommendationsState {
  final List<MovieEntity> movies;

  const GetRecommendationsLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class GetRecommendationsError extends GetRecommendationsState {
  final String errorMessage;

  const GetRecommendationsError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
