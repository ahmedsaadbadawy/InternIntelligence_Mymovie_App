import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/usecases/get_videos.dart';
import '../../../../../domain/usecases/movie_params.dart';
import 'videos_state.dart';

class VideosCubit extends Cubit<VideosState> {
  final GetVideos getVideos;

  VideosCubit({
    required this.getVideos,
  }) : super(VideosInitial());

  Future<void> loadVideos(int movieId) async {
    emit(VideosLoading());

    final eitherResponse = await getVideos(
      MovieParams(movieId),
    );

    eitherResponse.fold(
      (failure) => emit(VideoError(
        errorMessage: failure.message,
      )),
      (videos) => emit(VideosLoaded(videos)),
    );
  }
}
