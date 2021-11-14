import 'package:cubos_imdb/interface/movie_interface.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class ProviderMovie implements InterfaceMovie {
  var apiKey = "7e49e84a68cdbea10b67f65709d1bc64";
  var baseUrl = "https://api.themoviedb.org";

  var apiVersion = "3";
  var page = 1;
  var language = "pt-BR";

  @override
  Future<Response?> getMovieDetailsByID(sendData) async {
    var query = "movie/${sendData["movieId"]}";
    return await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language&append_to_response=credits",
        options: buildCacheOptions(Duration(hours: 24),
            maxStale: Duration(hours: 48)));
  }

  @override
  Future<Response?> listCategories() async {
    var query = "genre/movie/list";
    return await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language",
        options: buildCacheOptions(Duration(hours: 24),
            maxStale: Duration(hours: 48)));
  }

  @override
  Future<Response?> listCurrentTheatersMovie({int? nextPage}) async {
    var query = "movie/now_playing";

    return await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=${nextPage ?? page}&language=$language",
        options: buildCacheOptions(Duration(hours: 24),
            maxStale: Duration(hours: 48)));
  }

  @override
  Future<Response?> listDiscoverGenres(sendData, {int? nextPage}) async {
    var query = "discover/movie";
    return await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=${nextPage ?? page}&language=$language&with_genres=${sendData["genresId"]}",
        options: buildCacheOptions(Duration(hours: 24),
            maxStale: Duration(hours: 48)));
  }

  @override
  Future<Response?> searchMovieWithQuery(sendData) async {
    var query = "search/movie";
    return await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&query=${sendData["searchQuery"]}&page=$page&language=$language",
        options: buildCacheOptions(Duration(hours: 24),
            maxStale: Duration(hours: 48)));
  }
}
