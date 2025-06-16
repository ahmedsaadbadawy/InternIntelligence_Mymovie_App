import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/movie_carousel/movie_carousel_cubit.dart';
import '/di/get_it.dart';
import 'widgets/custom_drawer_widget.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_movie_sections/home_movie_sections.dart';
import 'widgets/movie_crousel_slider_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawerWidget(),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // Carousel Slider
                SliverToBoxAdapter(
                  child: BlocProvider(
                    create: (context) =>
                        getItInstance<MovieCarouselCubit>()..loadCarousel(),
                    child: const MovieCrouselSliderBuilder(),
                  ),
                ),

                // Movie Sections
                const SliverToBoxAdapter(
                  child: HomeMovieSections(),
                ),
              ],
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: HomeAppBar(),
            ),
          ],
        ),
      ),
    );
  }
}
