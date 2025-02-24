import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../Core/utils/api_constants.dart';
import '../../Core/utils/app_router.dart';
import '../../Core/utils/themes/theme_color.dart';

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
        context.push(
          AppRouter.kMovieDetailScreen,
          extra: movieId,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0.w),
        width: 120.w,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.baseImageUrl}$posterPath',
            fit: BoxFit.cover,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColor.royalBlue,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
