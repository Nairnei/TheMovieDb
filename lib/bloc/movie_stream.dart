import 'package:cubos_imdb/interface/movie_interface.dart';
import 'package:cubos_imdb/repository/movie_repository.dart';
import 'package:dio/dio.dart';

final streamMovie = StreamMovie();

class StreamMovie implements InterfaceMovie {
  final RepositoryMovie _repository = RepositoryMovie();

  @override
  Future<Response?> getMovieDetailsByID(sendData) {
    return _repository.getMovieDetailsByID(sendData);
  }

  @override
  Future<Response?> listCategories() {
    return _repository.listCategories();
  }

  @override
  Future<Response?> listCurrentTheatersMovie() {
    return _repository.listCurrentTheatersMovie();
  }

  @override
  Future<Response?> listDiscoverGenres(sendData) {
    return _repository.listDiscoverGenres(sendData);
  }

  @override
  Future<Response?> searchMovieWithQuery(sendData) {
    return _repository.searchMovieWithQuery(sendData);
  }
}
