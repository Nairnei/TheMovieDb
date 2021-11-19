import 'package:dio/dio.dart';

abstract class InterfaceMovie {
  ///list moview genres
  listCategories() {}

  ///list movies on Theater now
  Future<Response?> listCurrentTheatersMovie();

  ///Discover movies with genres
  Future<Response?> listDiscoverGenres(Map<String, dynamic> sendData);

  ///get details of movie to show a more complete details screen
  Future<Response?> getMovieDetailsByID(Map<String, dynamic> sendData);

  ///search movie by query
  Future<Response?> searchMovieWithQuery(Map<String, dynamic> sendData);
}
