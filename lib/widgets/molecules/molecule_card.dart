import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubos_imdb/bloc/Image_stream.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///Movie card molecule
class BuildCardMovie extends StatefulWidget {
  final MoviesResults result;

  BuildCardMovie(
    this.result, {
    Key? key,
  }) : super(key: key);

  @override
  _BuildCardMovieState createState() => _BuildCardMovieState();
}

class _BuildCardMovieState extends State<BuildCardMovie>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: FutureBuilder<String?>(
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Container(
                child: Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            );
          } else {
            return Ink(
              child: Hero(
                tag: snapshot.data!,
                child: CachedNetworkImage(
                  cacheKey: snapshot.data,
                  imageUrl: snapshot.data!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
        future: streamImage.getMovieUrlPoster(widget.result.posterPath ?? ""),
      ),
    );
  }

  ///true it`s not ok with more 100 itens, but stay here for a improvement
  @override
  bool get wantKeepAlive => false;
}
