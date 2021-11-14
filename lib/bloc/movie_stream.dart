import 'package:cubos_imdb/interface/movie_interface.dart';
import 'package:cubos_imdb/model/details_model.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:cubos_imdb/repository/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final streamMovie = StreamMovie();

class StreamMovie implements InterfaceMovie {
  final RepositoryMovie _repository = RepositoryMovie();

  BehaviorSubject<MoviesModel?> _behaviorSubjectMoviesOnTheater =
      BehaviorSubject.seeded(null);

  BehaviorSubject<DetailModel?> _behaviorSubjectDetail =
      BehaviorSubject.seeded(null);

  BehaviorSubject<MoviesModel?> get movies => _behaviorSubjectMoviesOnTheater;

  BehaviorSubject<DetailModel?> get details => _behaviorSubjectDetail;

  void dispose() {
    _behaviorSubjectMoviesOnTheater.close();
    _behaviorSubjectDetail.close();
  }

  @override
  Future<Response?> getMovieDetailsByID(sendData) async {
    _behaviorSubjectDetail.sink.add(null);
    Response? response = await _repository.getMovieDetailsByID(sendData);
    _behaviorSubjectDetail.sink.add(DetailModel.fromJson(response!.data));
  }

  @override
  Future<Response?> listCategories() {
    return _repository.listCategories();
  }

  @override
  Future<Response?> listCurrentTheatersMovie({int? nextPage}) async {
    Response? response =
        await _repository.listCurrentTheatersMovie(nextPage: nextPage);
    if (_behaviorSubjectMoviesOnTheater.value == null) {
      _behaviorSubjectMoviesOnTheater.sink
          .add(MoviesModel.fromJson(response!.data));
    } else {
      var aux = MoviesModel.fromJson(response!.data);
      _behaviorSubjectMoviesOnTheater.value!.results!.addAll(aux.results!);
      _behaviorSubjectMoviesOnTheater.value!.page = aux.page;
      _behaviorSubjectMoviesOnTheater.sink
          .add(_behaviorSubjectMoviesOnTheater.value);
    }
    return response;
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
