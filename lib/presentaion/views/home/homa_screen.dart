// presentation/screens/home_screen.dart
import 'package:flutter/material.dart';

import 'widgets/custom_carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CustomCarouselSlider(),
        ],
      ),
    );
  }
}
