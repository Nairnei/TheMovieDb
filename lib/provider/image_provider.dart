import 'package:cubos_imdb/interface/image_interface.dart';

///The ideal was to make a singleton api class for dio instantiation, but I'm running out of time to fix this for tomorrow's presentation
class ProviderImage implements InterfaceImage {
  String _backDropUrl = "https://image.tmdb.org";
  String _coverConfig = "/t/p/original/";
  String _posterConfig = "/t/p/w500/";
  String _pathNotFound =
      "https://www.themoviedb.org/assets/2/v4/logos/256x256-dark-bg-01a111196ed89d59b90c31440b0f77523e9d9a9acac04a7bac00c27c6ce511a9.png";

  @override
  Future<String?> getMovieUrlCover(String coverPath) async {
    if (coverPath.isEmpty) {
      return _pathNotFound;
    }
    return _backDropUrl + _coverConfig + coverPath;
  }

  @override
  Future<String?> getMovieUrlPoster(String posterPath) async {
    if (posterPath.isEmpty) {
      return _pathNotFound;
    }
    return _backDropUrl + _posterConfig + posterPath;
  }
}
