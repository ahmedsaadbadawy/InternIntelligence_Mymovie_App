import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/movie_detail_entity.dart';
import 'big_poster.dart';
import 'movie_recommendations_section.dart';

class MovieDetailScreenBody extends StatelessWidget {
  const MovieDetailScreenBody({
    super.key,
    required this.movieDetail,
    required this.movieId,
  });

  final MovieDetailEntity movieDetail;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BigPoster(
            movie: movieDetail,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 6.h,
            ),
            child: Text(
              movieDetail.overview,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: 4.h),
          MovieRecommendationsSection(movieId: movieId),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
