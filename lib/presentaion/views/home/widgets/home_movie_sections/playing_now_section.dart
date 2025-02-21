import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/playing_now/movie_playing_now_cubit.dart';
import '../../../../manager/playing_now/movie_playing_now_state.dart';
import '../../../../widgets/horizontal_movie_list.dart';

class PlayingNowSection extends StatelessWidget {
  const PlayingNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviePlayingNowCubit, MoviePlayingNowState>(
      builder: (context, state) {
        if (state is MoviePlayingNowLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MoviePlayingNowLoaded) {
          return HorizontalMovieList(
            title: 'Now Playing',
            movies: state.movies,
          );
        } else if (state is MoviePlayingNowError) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}