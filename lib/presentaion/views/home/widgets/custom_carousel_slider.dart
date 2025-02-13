import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'carousel_slider_card.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.5,
        viewportFraction: 1,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        //autoPlay: true,
        onPageChanged: (index, _) {},
      ),
      itemBuilder: (context, index, _) {
        return const CarouselSliderCard(
          movieId: 123,
          posterPath:
              "https://res.cloudinary.com/vistaprint/images/v1709129276/ideas-and-advice-prod/blogadmin/Bildschirmfoto-2024-02-28-um-15.07.36/Bildschirmfoto-2024-02-28-um-15.07.36.png?_i=AA",
        );
      },
    );
  }
}