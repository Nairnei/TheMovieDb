import 'package:dio/dio.dart';

abstract class InterfaceMovie {
  ///list moview genres
  listCategories() {}

  ///list movies on Theater now
  Future<Response?> listCurrentTheatersMovie();

  ///Discover movies with genres
  Future<Response?> listDiscoverGenres(var sendData);

  ///get details of movie to show a more complete details screen
  Future<Response?> getMovieDetailsByID(var sendData);

  ///search movie by query
  Future<Response?> searchMovieWithQuery(var sendData);
}
