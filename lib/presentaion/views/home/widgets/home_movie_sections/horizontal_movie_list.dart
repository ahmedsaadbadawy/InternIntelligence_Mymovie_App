// presentation/widgets/horizontal_movie_list.dart
import 'package:flutter/material.dart';
import '../../../../widgets/movie_card.dart';
import '/domain/entities/movie_entity.dart';

class HorizontalMovieList extends StatelessWidget {
  final String title;
  final List<MovieEntity> movies;

  const HorizontalMovieList({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200, // Adjust height as needed
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return MovieCard(
                movieId: movie.id,
                posterPath: movie.posterPath,
              );
            },
          ),
        ),
      ],
    );
  }
}