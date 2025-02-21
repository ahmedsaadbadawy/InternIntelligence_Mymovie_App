import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/themes/theme_color.dart';
import '../manager/SearchMovie/search_movie_cubit.dart';
import '../manager/SearchMovie/search_movie_state.dart';
import 'search_movie_card.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesCubit searchMoviesCubit;

  CustomSearchDelegate(this.searchMoviesCubit);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Colors.grey),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue, //violet
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 20.h,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMoviesCubit.searchForMovies(query);

    return BlocBuilder<SearchMoviesCubit, SearchMoviesState>(
      bloc: searchMoviesCubit,
      builder: (context, state) {
        if (state is SearchMoviesError) {
          return Center(
            child: Text(
              state.errorMessage,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is SearchMoviesLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(
              child: Text(
                'No movies found',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => SearchMovieCard(
              movie: movies[index],
            ),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
