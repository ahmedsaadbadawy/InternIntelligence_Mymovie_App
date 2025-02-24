import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/usecases/get_cast.dart';
import '../../../../../domain/usecases/movie_params.dart';
import 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final GetCast getCast;

  CastCubit({
    required this.getCast,
  }) : super(CastInitial());

  Future<void> loadCast(int movieId) async {
    emit(CastLoading());

    final eitherResponse = await getCast(
      MovieParams(movieId),
    );

    eitherResponse.fold(
      (failure) => emit(CastError(
        errorMessage: failure.message,
      )),
      (cast) => emit(CastLoaded(cast)),
    );
  }
}
