import 'package:cubos_imdb/interface/image_interface.dart';
import 'package:cubos_imdb/repository/image_repository.dart';

final streamImage = StreamImage();

class StreamImage implements InterfaceImage {
  final RepositoryImage _repository = RepositoryImage();

  @override
  Future<String?> getMovieUrlCover(String coverPath) async {
    return _repository.getMovieUrlCover(coverPath);
  }

  @override
  Future<String?> getMovieUrlPoster(String posterPath) async {
    return _repository.getMovieUrlPoster(posterPath);
  }
}
