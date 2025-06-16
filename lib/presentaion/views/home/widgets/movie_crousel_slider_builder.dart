import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/movie_carousel/movie_carousel_cubit.dart';
import '../../../manager/movie_carousel/movie_carousel_state.dart';
import 'custom_carousel_slider.dart';

class MovieCrouselSliderBuilder extends StatelessWidget {
  const MovieCrouselSliderBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
      builder: (context, state) {
        if (state is MovieCarouselLoading) {
          return const Center(
              child: CircularProgressIndicator());
        } else if (state is MovieCarouselLoaded) {
          return CustomCarouselSlider(movies: state.movies);
        } else if (state is MovieCarouselError) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox.shrink();
      },
    );
  }
}