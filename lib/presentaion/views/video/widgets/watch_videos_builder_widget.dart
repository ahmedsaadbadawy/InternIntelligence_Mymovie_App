import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Core/utils/themes/theme_color.dart';

import '../../../../Core/utils/app_router.dart';
import '../../../../di/get_it.dart';
import '../../../widgets/custom_text_button.dart';
import '../../movie_detail/manager/videos/videos_cubit.dart';
import '../../movie_detail/manager/videos/videos_state.dart';

class WatchVideosBuilderWidget extends StatelessWidget {
  final int movieId;

  const WatchVideosBuilderWidget({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<VideosCubit>()..loadVideos(movieId),
      child: BlocBuilder<VideosCubit, VideosState>(
        builder: (context, state) {
          if (state is VideosLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.royalBlue,
              ),
            );
          } else if (state is VideosLoaded && state.videos.isNotEmpty) {
            return CustomTextButton(
              text: 'watchTrailers',
              onPressed: () {
                context.push(
                  AppRouter.kwatchVideoScreen,
                  extra: state.videos,
                );
              },
            );
          } else if (state is VideoError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
