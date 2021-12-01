///a helper to grab images from TheMoviesDB's cdn
abstract class InterfaceImage {
  ///get the url cover of movie
  Future<String?> getMovieUrlCover(String path);

  ///get the url poster of moview
  Future<String?> getMovieUrlPoster(String path);
}
