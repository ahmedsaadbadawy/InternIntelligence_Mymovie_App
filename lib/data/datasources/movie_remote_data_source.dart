import '../models/cast_crew_result_data_model.dart';
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/movies_result_model.dart';
import '../models/video_model.dart';
import '../models/video_result_model.dart';
import 'api_client.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int movieId);
  Future<List<MovieModel>> getRecommendations(int movieId);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VideoModel>> getVideos(int id);
  Future<List<MovieModel>> getSearchedMovies(String searchTerm);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies ?? [];
    //print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies ?? [];
    //print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies ?? [];
    //print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies ?? [];
    //print(movies);
    return movies;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await _client.get('movie/$movieId');
    final movie = MovieDetailModel.fromJson(response);
    return movie;
  }

  @override
  Future<List<MovieModel>> getRecommendations(int movieId) async {
    final response = await _client.get('movie/$movieId/recommendations');
    final movies = MoviesResultModel.fromJson(response).movies ?? [];
    return movies;
  }

  @override
  Future<List<MovieModel>> getSearchedMovies(String searchTerm) async {
    final response = await _client.get('search/movie', params: {
      'query': searchTerm,
    });
    final movies = MoviesResultModel.fromJson(response).movies ?? [];
    return movies;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await _client.get('movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).videos;
    print(videos);
    return videos;
  }
}
