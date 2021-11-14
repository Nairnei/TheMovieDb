import 'package:cubos_imdb/interface/movie_interface.dart';
import 'package:cubos_imdb/model/categories_model.dart';
import 'package:cubos_imdb/model/details_model.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:cubos_imdb/repository/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

final streamMovie = StreamMovie();

class StreamMovie implements InterfaceMovie {
  final RepositoryMovie _repository = RepositoryMovie();

  BehaviorSubject<MoviesModel?> _behaviorSubjectMoviesOnHome =
      BehaviorSubject.seeded(null);

  BehaviorSubject<DetailModel?> _behaviorSubjectDetail =
      BehaviorSubject.seeded(null);

  BehaviorSubject<CategoriesModel?> _behaviorSubjctCategories =
      BehaviorSubject.seeded(null);

  List<String> filters = [];

  BehaviorSubject<MoviesModel?> get movies => _behaviorSubjectMoviesOnHome;

  BehaviorSubject<CategoriesModel?> get categories => _behaviorSubjctCategories;

  BehaviorSubject<DetailModel?> get details => _behaviorSubjectDetail;

  void dispose() {
    _behaviorSubjectMoviesOnHome.close();
    _behaviorSubjectDetail.close();
    _behaviorSubjctCategories.close();
  }

  @override
  Future<Response?> getMovieDetailsByID(sendData) async {
    _behaviorSubjectDetail.sink.add(null);
    Response? response = await _repository.getMovieDetailsByID(sendData);
    _behaviorSubjectDetail.sink.add(DetailModel.fromJson(response!.data));
  }

  @override
  Future<Response?> listCategories() async {
    Response? response = await _repository.listCategories();
    _behaviorSubjctCategories.sink
        .add(CategoriesModel.fromJson(response!.data));
    return response;
  }

  @override
  Future<Response?> listCurrentTheatersMovie({int? nextPage}) async {
    Response? response =
        await _repository.listCurrentTheatersMovie(nextPage: nextPage);
    if (_behaviorSubjectMoviesOnHome.value == null) {
      _behaviorSubjectMoviesOnHome.sink
          .add(MoviesModel.fromJson(response!.data));
    } else {
      var aux = MoviesModel.fromJson(response!.data);
      _behaviorSubjectMoviesOnHome.value!.results!.addAll(aux.results!);
      _behaviorSubjectMoviesOnHome.value!.page = aux.page;
      _behaviorSubjectMoviesOnHome.sink.add(_behaviorSubjectMoviesOnHome.value);
    }
    return response;
  }

  @override
  Future<Response?> listDiscoverGenres(sendData) async {
    Response? response;
    if (sendData["genresId"] != null) {
      response = await _repository.listDiscoverGenres(sendData);
    } else {
      response = await _repository.listCurrentTheatersMovie();
    }
    _behaviorSubjectMoviesOnHome.sink.add(MoviesModel.fromJson(response!.data));
    return response;
  }

  @override
  Future<Response?> searchMovieWithQuery(sendData) async {
    Response? response;

    if (sendData["searchQuery"] != null ||
        sendData["searchQuery"].toString().isNotEmpty) {
      response = await _repository.searchMovieWithQuery(sendData);
    } else {
      response = await _repository.listCurrentTheatersMovie();
    }
    _behaviorSubjectMoviesOnHome.sink.add(MoviesModel.fromJson(response!.data));
    return response;
  }

  void addFilter(id) {
    if (filters.contains(id.toString())) {
      filters.remove(id.toString());
    } else {
      filters.add(id.toString());
    }
  }

  String? getFilter() {
    String queryFilter = "";
    var aux;
    filters.forEach((element) {
      queryFilter = queryFilter + element + ",";
    });

    if (queryFilter.length > 1) {
      aux = queryFilter.substring(
        0,
        queryFilter.length - 1,
      );
    }

    return aux;
  }
}
