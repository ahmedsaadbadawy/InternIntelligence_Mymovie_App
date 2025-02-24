import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager/MovieDetail/movie_detail_cubit.dart';
import 'manager/MovieDetail/movie_detail_state.dart';
import 'widgets/movie_detail_screen_body.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded) {
              final movieDetail = state.movieDetailEntity;
              return MovieDetailScreenBody(
                movieDetail: movieDetail,
              );
            } else if (state is MovieDetailError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
