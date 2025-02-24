import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/Core/utils/themes/theme_color.dart';

import '../../../../di/get_it.dart';
import '../manager/cast/cast_cubit.dart';
import '../manager/cast/cast_state.dart';
import 'cast_list_view.dart';

class CastBuilderWidget extends StatelessWidget {
  final int movieId;

  const CastBuilderWidget({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<CastCubit>()..loadCast(movieId),
      child: BlocBuilder<CastCubit, CastState>(
        builder: (context, state) {
          if (state is CastLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.royalBlue,
              ),
            );
          } else if (state is CastLoaded) {
            return SizedBox(
              height: 180.w,
              child: CastListView(castlist: state.cast),
            );
          } else if (state is CastError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
