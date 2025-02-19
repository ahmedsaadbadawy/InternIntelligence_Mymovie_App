// presentation/widgets/horizontal_movie_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'movie_card.dart';
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
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.purple,
            ),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 200.w,
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
