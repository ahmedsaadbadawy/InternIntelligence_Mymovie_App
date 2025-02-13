import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../data/datasources/api_client.dart';
import '../data/datasources/movie_remote_data_source.dart';
import '../data/repositories/movie_repository_impl.dart';
import '../domain/repositories/movie_repository.dart';
import '../domain/usecases/get_coming_soon.dart';
import '../domain/usecases/get_playing_now.dart';
import '../domain/usecases/get_popular.dart';
import '../domain/usecases/get_trending.dart';
import '../presentaion/manager/movie_carousel/movie_carousel_cubit.dart';

final getItInstance = GetIt.I;
Future init() async {
  
  // Dio
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

  // Cubits
  getItInstance.registerFactory(
    () => MovieCarouselCubit(getTrending: getItInstance()),
  );  
}
