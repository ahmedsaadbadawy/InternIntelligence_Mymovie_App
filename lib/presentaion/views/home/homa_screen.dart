// presentation/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/get_it.dart';
import '../../manager/movie_carousel/movie_carousel_cubit.dart';
import 'widgets/custom_carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getItInstance<MovieCarouselCubit>()..loadCarousel(),
        child: const Column(
          children: [
            CustomCarouselSlider(),
          ],
        ),
      ),
    );
  }
}
