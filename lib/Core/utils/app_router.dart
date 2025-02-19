import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/presentaion/views/home/homa_screen.dart';
import 'package:movie_app/presentaion/views/movie_detail/manager/MovieDetail/movie_detail_cubit.dart';
import 'package:movie_app/presentaion/views/movie_detail/movie_detail_screen.dart';
import 'package:movie_app/presentaion/views/search/manager/SearchMovie/search_movie_cubit.dart';
import 'package:movie_app/presentaion/views/search/search_screen.dart';

import '../../di/get_it.dart';

abstract class AppRouter {
  static const kHomeScreen = '/HomeScreen';
  static const kMovieDetailScreen = '/MovieDetailScreen';
  static const kSearchScreen = '/SearchScreen';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: kMovieDetailScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getItInstance<MovieDetailCubit>()
            ..loadMovieDetail(state.extra as int),
          child: MovieDetailScreen(
            movieId: state.extra as int,
          ),
        ),
      ),
      GoRoute(
        path: kSearchScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => getItInstance<SearchMoviesCubit>()
            ..searchForMovies(state.extra as String),
          child: const SearchScreen(
            //searchText: state.extra as String,
          ),
        ),
      ),
    ],
  );
}
