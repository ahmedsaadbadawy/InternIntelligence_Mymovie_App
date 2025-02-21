import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';
import '../models/movies_result_model.dart';
import 'api_client.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int movieId);
  Future<List<MovieModel>> getRecommendations(int movieId);
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
}
