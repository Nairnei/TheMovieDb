import 'package:cubos_imdb/bloc/Image_stream.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  ///backdrop
  test("getMovieUrlCover()", () async {
    String? coverUrl =
        await streamImage.getMovieUrlCover("bCXLsO2MJWzYYBJoavGOZN5iqGn.jpg");
    expect(coverUrl!.isEmpty, false);
  });

  ///poster
  test("getMovieUrlPoster()", () async {
    String? posterUrl =
        await streamImage.getMovieUrlPoster("ujWOI68vGkfLOgEDmcrjIS6il7B.jpg");
    expect(posterUrl!.isEmpty, false);
  });
}
