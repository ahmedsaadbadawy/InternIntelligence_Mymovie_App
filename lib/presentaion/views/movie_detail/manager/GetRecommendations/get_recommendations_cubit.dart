import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/get_recommendations.dart';
import '../../../../../domain/usecases/movie_params.dart';
import 'get_recommendations_state.dart';

class GetRecommendationsCubit extends Cubit<GetRecommendationsState> {
  final GetRecommendations getRecommendations;

  GetRecommendationsCubit({
    required this.getRecommendations,
  }) : super(GetRecommendationsInitial());

  Future<void> loadRecommendations(int movieId) async {
    emit(GetRecommendationsLoading());

    final eitherResponse =
        await getRecommendations(
      MovieParams(movieId),
    );

    eitherResponse.fold(
      (failure) => emit(GetRecommendationsError(
        errorMessage: failure.message,
      )),
      (recommendations) => emit(GetRecommendationsLoaded(recommendations)),
    );
  }
}
