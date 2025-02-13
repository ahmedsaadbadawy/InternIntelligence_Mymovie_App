import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/movie_entity.dart';
import 'carousel_slider_card.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
    required this.movies,
  });
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
            itemCount: movies.length,
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.5,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              autoPlay: true,
              onPageChanged: (index, _) {},
            ),
            itemBuilder: (context, index, _) {
              final movie = movies[index];
              return CarouselSliderCard(
                movieId: movie.id,
                posterPath: movie.posterPath,
              );
            },
          );
  }
}