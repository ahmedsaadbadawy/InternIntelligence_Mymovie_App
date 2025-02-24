import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di/get_it.dart';
import 'manager/SearchMovie/search_movie_cubit.dart';
import 'widgets/custom_search_movie_delegate.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<SearchMoviesCubit>(),
      child: Builder(
        builder: (context) {
          final searchMoviesCubit = BlocProvider.of<SearchMoviesCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Search Movies'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(searchMoviesCubit),
                    );
                  },
                ),
              ],
            ),
            body: const Center(
              child: Text('Use the search icon to find movies.'),
            ),
          );
        },
      ),
    );
  }
}
