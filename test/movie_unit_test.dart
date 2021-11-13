import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ///get movie details by id
  test("getMovieDetailsByID", () async {
    Response? response =
        await streamMovie.getMovieDetailsByID({"movieId": "5"});
    expect(response!.statusCode, 200);
  });

  ///list tendency movie with paginate and language example
  test("listCategories", () async {
    Response? response = await streamMovie.listCategories();
    expect(response!.statusCode, 200);
  });

  ///list movie on Theaters with paginate and language example
  test("listCurrentTheatersMovie", () async {
    Response? response = await streamMovie.listCurrentTheatersMovie();
    expect(response!.statusCode, 200);
  });

  ///discover movies with genres
  test("listDiscoverGenres", () async {
    var genreId = "16,28";
    Response? response =
        await streamMovie.listDiscoverGenres({"genresId": genreId});
    expect(response!.statusCode, 200);
  });

  ///search movie with querySearch
  test("searchMovieWithQuery", () async {
    Response? response =
        await streamMovie.searchMovieWithQuery({"searchQuery": "frozen"});
    expect(response!.statusCode, 200);
  });
}
