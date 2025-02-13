import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../di/get_it.dart';
import '../../../../manager/coming_soon/movie_coming_soon_cubit.dart';
import '../../../../manager/movie_popular/movie_popular_cubit.dart';
import '../../../../manager/playing_now/movie_playing_now_cubit.dart';
import 'coming_soon_section.dart';
import 'playing_now_section.dart';
import 'popular_movies_section.dart';

class HomeMovieSections extends StatelessWidget {
  const HomeMovieSections({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getItInstance<MoviePlayingNowCubit>()..loadPlayingNow(),
        ),
        BlocProvider(
          create: (context) =>
              getItInstance<MoviePopularCubit>()..loadPopular(),
        ),
        BlocProvider(
          create: (context) =>
              getItInstance<MovieComingSoonCubit>()..loadComingSoon(),
        ),
      ],
      child: Column(
        children: [
          SizedBox(height: 8.h),
          const PlayingNowSection(),
          SizedBox(height: 8.h),
          const PopularMoviesSection(),
          SizedBox(height: 8.h),
          const ComingSoonSection(),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
