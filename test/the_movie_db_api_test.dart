import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var apiKey = "7e49e84a68cdbea10b67f65709d1bc64";
  var baseUrl = "https://api.themoviedb.org";

  var apiVersion = "3";
  var page = 1;
  var language = "pt-BR";

  //--------------------- TheMovieDB API-----------------------------

  ///get movie details by id
  test("getMovieDetailsByID", () async {
    var query = "movie/438631";
    var response =
        await Dio().get('$baseUrl/$apiVersion/$query?api_key=$apiKey');
    expect(response.statusCode, 200);
  });

  ///list tendency movie with paginate and language example
  test("listCategories", () async {
    var query = "genre/movie/list";
    var response = await Dio().get(
        "$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language");
    expect(response.statusCode, 200);
  });

  ///list movie on Theaters with paginate and language example
  test("listCurrentTheatersMovie", () async {
    var query = "movie/now_playing";
    var response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&page=$page&language=$language');
    expect(response.statusCode, 200);
  });

  ///discover movies with genres
  test("listDiscoverGenres", () async {
    var response = await Dio().get('movie_unit_test.dart');
    expect(response.statusCode, 200);
  });

  ///search movie with querySearch
  test("searchMovieWithQuery", () async {
    var query = "search/movie";
    var querySearch = "007";
    var response = await Dio().get(
        '$baseUrl/$apiVersion/$query?api_key=$apiKey&query=$querySearch&page=$page&language=$language');
    expect(response.statusCode, 200);
  });
}
