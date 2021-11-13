import 'package:dio/dio.dart';

abstract class InterfaceMovie {
  ///list moview genres
  Future<Response?> listCategories() async {}

  ///list movies on Theater now
  Future<Response?> listCurrentTheatersMovie() async {}

  ///Discover movies with genres
  Future<Response?> listDiscoverGenres(var sendData) async {}

  ///get details of movie to show a more complete details screen
  Future<Response?> getMovieDetailsByID(var sendData) async {}

  ///search movie by query
  Future<Response?> searchMovieWithQuery(var sendData) async {}
}
