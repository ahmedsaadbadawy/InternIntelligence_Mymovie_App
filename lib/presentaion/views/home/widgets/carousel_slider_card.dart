// presentation/widgets/movie_card_widget.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../Core/utils/api_constants.dart';

class CarouselSliderCard extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const CarouselSliderCard({
    super.key,
    required this.movieId,
    required this.posterPath,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          width: MediaQuery.of(context).size.width,
          imageUrl: '${ApiConstants.baseImageUrl}$posterPath',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
