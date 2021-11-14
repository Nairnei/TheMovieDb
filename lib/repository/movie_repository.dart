import 'package:cubos_imdb/interface/movie_interface.dart';
import 'package:cubos_imdb/provider/movie_provider.dart';
import 'package:dio/src/response.dart';

class RepositoryMovie implements InterfaceMovie {
  ProviderMovie _provider = ProviderMovie();

  @override
  Future<Response?> getMovieDetailsByID(sendData) {
    return _provider.getMovieDetailsByID(sendData);
  }

  @override
  Future<Response?> listCategories() {
    return _provider.listCategories();
  }

  @override
  Future<Response?> listCurrentTheatersMovie({int? nextPage}) {
    return _provider.listCurrentTheatersMovie(nextPage: nextPage);
  }

  @override
  Future<Response?> listDiscoverGenres(sendData) {
    return _provider.listDiscoverGenres(sendData);
  }

  @override
  Future<Response?> searchMovieWithQuery(sendData) {
    return _provider.searchMovieWithQuery(sendData);
  }
}
