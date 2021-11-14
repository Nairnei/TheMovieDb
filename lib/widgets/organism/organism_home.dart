import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/model/categories_model.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:cubos_imdb/widgets/atoms/atom_gradient.dart';
import 'package:cubos_imdb/widgets/molecules/molecule_card.dart';
import 'package:cubos_imdb/widgets/molecules/molecule_material.dart';
import 'package:cubos_imdb/widgets/organism/organism_chip.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildGenres() {
  return StreamBuilder(
      stream: streamMovie.categories.stream,
      initialData: streamMovie.categories.value,
      builder: (context, AsyncSnapshot<CategoriesModel?> snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          if (snapshot.data != null)
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 14),
              itemBuilder: (context, index) {
                return BuildChipFilter(snapshot.data!.genres![index]);
              },
              itemCount: snapshot.data!.genres!.length,
            );
          return Container();
        } else {
          return Container();
        }
      });
}

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
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: ShaderMask(
                                  shaderCallback: (rect) {
                                    return buildLinearGradientCard()
                                        .createShader(Rect.fromLTRB(
                                            0, 0, rect.width, rect.height));
                                  },
                                  blendMode: BlendMode.darken,
                                  child: BuildCardMovie(
                                      snapshot.data!.results![index]),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 32,
                              right: 24,
                              left: 24,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.results![index].title,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                  buildCategories(
                                      snapshot.data!.results![index].genreIds)
                                ],
                              ),
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

Widget buildCategories(List? genreIds) {
  try {
    List<Widget> aux = [];

    for (int i = 0; i < genreIds!.length; i++) {
      if (i == genreIds.length - 1) {
        aux.add(Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            streamMovie.categories.value!.genres!
                .firstWhere((element) => element.id == genreIds[i])
                .name,
            style: GoogleFonts.montserrat(
                fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ));
      } else {
        aux.add(Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              streamMovie.categories.value!.genres!
                      .firstWhere((element) => element.id == genreIds[i])
                      .name +
                  "   -   ",
              style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            )));
      }
    }
    return Wrap(children: aux);
  } catch (error) {
    return Container();
  }
}
