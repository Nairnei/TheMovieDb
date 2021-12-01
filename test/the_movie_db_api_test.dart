import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String apiKey = "7e49e84a68cdbea10b67f65709d1bc64";
  String baseUrl = "https://api.themoviedb.org";

  String apiVersion = "3";
  int page = 1;
  String language = "pt-BR";

  //--------------------- TheMovieDB API-----------------------------

  ///get movie details by id
  test("getMovieDetailsByID", () async {
    String query = "movie/438631";
    Response? response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&append_to_response=credits');
    print(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&append_to_response=credits");
    expect(response.statusCode, 200);
  });

  ///list tendency movie with paginate and language example
  test("listCategories", () async {
    String query = "genre/movie/list";
    Response? response = await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language");
    print(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language");
    expect(response.statusCode, 200);
  });

  ///list movie on Theaters with paginate and language example
  test("listCurrentTheatersMovie", () async {
    String query = "movie/now_playing";
    Response? response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language');
    expect(response.statusCode, 200);
  });

  ///discover movies with genres
  test("listDiscoverGenres", () async {
    String genreId = "16,28";
    String query = "discover/movie";
    Response? response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language&with_genres=$genreId');
    expect(response.statusCode, 200);
  });

  ///search movie with querySearch
  test("searchMovieWithQuery", () async {
    String query = "search/movie";
    String querySearch = "007";
    Response? response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&query=$querySearch&page=$page&language=$language');
    expect(response.statusCode, 200);
  });
}
