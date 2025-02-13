import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/movie_carousel/movie_carousel_cubit.dart';
import '../../manager/movie_carousel/movie_carousel_state.dart';
import '/di/get_it.dart';
import 'widgets/custom_carousel_slider.dart';
import 'widgets/home_movie_sections/home_movie_sections.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<MovieCarouselCubit>()..loadCarousel(),
      child: Scaffold(
      body: CustomScrollView(
        slivers: [
        // Carousel Slider
        SliverToBoxAdapter(
          child: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoading) {
            return const Center(child: CircularProgressIndicator());
            } else if (state is MovieCarouselLoaded) {
            return CustomCarouselSlider(movies: state.movies);
            } else if (state is MovieCarouselError) {
            return Center(child: Text(state.errorMessage));
            }
            return const SizedBox.shrink();
          },
          ),
        ),

        // Movie Sections
        const SliverToBoxAdapter(
          child: HomeMovieSections(),
        ),
        ],
      ),
      ),
    );
  }
}