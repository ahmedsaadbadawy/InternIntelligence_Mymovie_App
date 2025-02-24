import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/movie_popular/movie_popular_cubit.dart';
import '../../../../manager/movie_popular/movie_popular_state.dart';
import '../../../../widgets/horizontal_movie_list.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviePopularCubit, MoviePopularState>(
      builder: (context, state) {
        if (state is MoviePopularLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MoviePopularLoaded) {
          return HorizontalMovieList(
            title: 'Popular',
            movies: state.movies,
          );
        } else if (state is MoviePopularError) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}