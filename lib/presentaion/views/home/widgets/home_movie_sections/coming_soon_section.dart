import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/coming_soon/movie_coming_soon_cubit.dart';
import '../../../../manager/coming_soon/movie_coming_soon_state.dart';
import 'horizontal_movie_list.dart';

class ComingSoonSection extends StatelessWidget {
  const ComingSoonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieComingSoonCubit, MovieComingSoonState>(
      builder: (context, state) {
        if (state is MovieComingSoonLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MovieComingSoonLoaded) {
          return HorizontalMovieList(
            title: 'Coming Soon',
            movies: state.movies,
          );
        } else if (state is MovieComingSoonError) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}