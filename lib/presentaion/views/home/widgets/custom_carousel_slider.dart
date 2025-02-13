import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../manager/movie_carousel/movie_carousel_cubit.dart';
import '../../../manager/movie_carousel/movie_carousel_state.dart';
import 'carousel_slider_card.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
      builder: (context, state) {
        if (state is MovieCarouselLoaded) {
          return CarouselSlider.builder(
            itemCount: state.movies.length,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.5,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, _) {},
            ),
            itemBuilder: (context, index, _) {
              final movie = state.movies[index];
              return CarouselSliderCard(
                movieId: movie.id,
                posterPath: movie.posterPath,
              );
            },
          );
        } else if (state is MovieCarouselError) {
          return Center(child: Text(state.errorMessage));
        }
        else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}