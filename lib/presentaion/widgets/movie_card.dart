import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../Core/utils/api_constants.dart';
import '../../Core/utils/app_router.dart';

class MovieCard extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCard({
    super.key,
    required this.movieId,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(
          AppRouter.kMovieDetailScreen,
          extra: movieId,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        width: 120,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.baseImageUrl}$posterPath',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
