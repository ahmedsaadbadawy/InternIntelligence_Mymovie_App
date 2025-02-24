import 'package:equatable/equatable.dart';
import '../../../../../domain/entities/video_entity.dart';

abstract class VideosState extends Equatable {
  const VideosState();

  @override
  List<Object?> get props => [];
}

class VideosInitial extends VideosState {}

class VideosLoading extends VideosState {}

class VideosLoaded extends VideosState {
  final List<VideoEntity> videos;

  const VideosLoaded(this.videos);

  @override
  List<Object?> get props => [videos];
}

class VideoError extends VideosState {
  final String errorMessage;

  const VideoError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
