import 'package:cubos_imdb/interface/movie_interface.dart';
import 'package:cubos_imdb/repository/image_repository.dart';
import 'package:dio/dio.dart';

final streamMovie = StreamMovie();

class StreamMovie implements InterfaceMovie {
  final RepositoryImage _repository = RepositoryImage();

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
