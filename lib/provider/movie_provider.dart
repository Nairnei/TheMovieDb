import 'package:cubos_imdb/interface/movie_interface.dart';
import 'package:dio/src/response.dart';

class ProviderMovie implements InterfaceMovie {
  @override
  Future<Response?> getMovieDetailsByID(sendData) {
    // TODO: implement getMovieDetailsByID
    throw UnimplementedError();
  }

  @override
  Future<Response?> listCategories() {
    // TODO: implement listCategories
    throw UnimplementedError();
  }

  @override
  Future<Response?> listCurrentTheatersMovie() {
    // TODO: implement listCurrentTheatersMovie
    throw UnimplementedError();
  }

  @override
  Future<Response?> listDiscoverGenres(sendData) {
    // TODO: implement listDiscoverGenres
    throw UnimplementedError();
  }

  @override
  Future<Response?> searchMovieWithQuery(sendData) {
    // TODO: implement searchMovieWithQuery
    throw UnimplementedError();
  }
}
