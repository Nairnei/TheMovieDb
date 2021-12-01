import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String backDropUrl = "https://image.tmdb.org";

  //--------------------- TheMovieDB CDN -----------------------------

  ///This have any configuration, i go use a standard configuration
  ///get image cover movie
  test("getCoverByPath", () async {
    String query = "/t/p/w500";
    String backDropPath = "ujWOI68vGkfLOgEDmcrjIS6il7B.jpg";
    Response? response = await Dio().get('$backDropUrl/$query/$backDropPath');
    expect(response.statusCode, 200);
  });

  ///This have any configuration, i go use a standard configuration
  ///get the image Poster movie
  test("getPosterByPath", () async {
    String query = "/t/p/w500";
    String posterPath = "ujWOI68vGkfLOgEDmcrjIS6il7B.jpg";
    Response? response = await Dio().get('$backDropUrl/$query/$posterPath');
    expect(response.statusCode, 200);
  });
}
