import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:cubos_imdb/widgets/molecules/molecule_card.dart';
import 'package:cubos_imdb/widgets/molecules/molecule_material.dart';
import 'package:flutter/material.dart';

StreamBuilder<MoviesModel?> buildStreamBuilderMovies(
    {ScrollController? gridController}) {
  return StreamBuilder<MoviesModel?>(
      stream: streamMovie.movies,
      initialData: streamMovie.movies.value,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          if (snapshot.data != null) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20, top: 0, bottom: 0),
              child: ListView.builder(
                  itemCount: snapshot.data!.results!.length,
                  padding: EdgeInsets.only(top: 64),
                  controller: gridController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: AspectRatio(
                        aspectRatio: 8 / 12,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: BuildCardMovie(
                                  snapshot.data!.results![index]),
                            ),
                            Positioned.fill(
                              child: buildMaterialRippleEffect(
                                  context, snapshot.data!, index),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        } else {
          return Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          );
        }
      });
}
