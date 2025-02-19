import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentaion/views/movie_detail/manager/GetRecommendations/get_recommendations_cubit.dart';
import 'package:movie_app/presentaion/views/movie_detail/manager/GetRecommendations/get_recommendations_state.dart';

import '../../../../di/get_it.dart';
import '../../home/widgets/home_movie_sections/horizontal_movie_list.dart';

class MovieRecommendationsSection extends StatelessWidget {
  const MovieRecommendationsSection({super.key, required this.movieId});

  final int movieId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<GetRecommendationsCubit>()..loadRecommendations(movieId),
      child: BlocBuilder<GetRecommendationsCubit, GetRecommendationsState>(
        builder: (context, state) {
          if (state is GetRecommendationsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetRecommendationsLoaded) {
            return HorizontalMovieList(
              title: 'Recommendations',
              movies: state.movies,
            );
          } else if (state is GetRecommendationsError) {
            return Center(child: Text(state.errorMessage));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
