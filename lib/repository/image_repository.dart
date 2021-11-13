import 'package:cubos_imdb/interface/image_interface.dart';
import 'package:cubos_imdb/provider/image_provider.dart';

class RepositoryImage implements InterfaceImage {
  ProviderImage _provider = ProviderImage();

  @override
  Future<String?> getMovieUrlCover(String path) {
    // TODO: implement getMovieUrlCover
    throw UnimplementedError();
  }

  @override
  Future<String?> getMovieUrlPoster(String path) {
    // TODO: implement getMovieUrlPoster
    throw UnimplementedError();
  }
}
