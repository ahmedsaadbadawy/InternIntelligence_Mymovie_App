import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/api_client.dart';
import '../data/datasources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_coming_soon.dart';
import '../domain/usecases/get_movie_detail.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../presentaion/manager/coming_soon/movie_coming_soon_cubit.dart';
import '../presentaion/manager/movie_carousel/movie_carousel_cubit.dart';
import '../presentaion/manager/movie_popular/movie_popular_cubit.dart';
import '../presentaion/manager/playing_now/movie_playing_now_cubit.dart';

final getItInstance = GetIt.I;
Future init() async {
  // Dio
  // lazy singleton: create the instance when it is first called only and reuse it for subsequent calls.
  getItInstance.registerLazySingleton<Dio>(() => Dio());

  // ApiClient / ApiServices
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  // Data sources
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  // Repositories
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));

  // Use cases
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));

  // Cubits
  // registerFactory: recreate the instance every time it is called
  getItInstance.registerFactory(
    () => MovieCarouselCubit(getTrending: getItInstance()),
  );
  getItInstance.registerFactory(
    () => MoviePlayingNowCubit(getPlayingNow: getItInstance()),
  );
  getItInstance.registerFactory(
    () => MoviePopularCubit(getPopular: getItInstance()),
  );
  getItInstance.registerFactory(
    () => MovieComingSoonCubit(getComingSoon: getItInstance()),
  );
}
