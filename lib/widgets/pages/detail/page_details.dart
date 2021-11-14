import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubos_imdb/bloc/Image_stream.dart';
import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/model/details_model.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:cubos_imdb/widgets/molecules/molecule_card.dart';
import 'package:cubos_imdb/widgets/pages/detail/page_controller.dart';
import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  final MoviesResults result;

  PageDetail(this.result);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<PageDetail>
    with AutomaticKeepAliveClientMixin {
  @override
  void dispose() {
    // TODO: implement dispose
    controllerDetailPage.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controllerDetailPage.init();
    streamMovie
        .getMovieDetailsByID({"movieId": widget.result.id}).then((value) => {
              Future.delayed(Duration(milliseconds: 300), () {
                controllerDetailPage.ready();
              })
            });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Material(
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 56.0, left: 52, right: 52, bottom: 32),
                    child: BuildCardMovie(widget.result),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.result.voteAverage} / 10"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.result.title}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${widget.result.originalTitle}"),
                    ],
                  ),
                ),
                StreamBuilder(
                    initialData: streamMovie.details.stream.value,
                    stream: streamMovie.details.stream,
                    builder: (context, AsyncSnapshot<DetailModel?> snapshot) {
                      if (snapshot.connectionState !=
                          ConnectionState.waiting) if (snapshot.data == null) {
                        return Container();
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffF1F3F5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        // border: Border.all(
                                        //   width: 0.4,
                                        // ),
                                      ),
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Ano: "
                                          "${widget.result.releaseDate.toString().split("-").first}"),
                                    ),
                                  ),

                                  ///other get?
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xffF1F3F5),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        // border: Border.all(
                                        //   width: 0.4,
                                        // ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: buildHourMoview(
                                            snapshot.data!.runtime!.toString()),
                                      ),
                                    ),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            ),

                            ///other get?
                            buildGenres(),
                            Padding(
                              padding: const EdgeInsets.only(top: 56.0),
                              child: Text("Descrição"),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 20),
                              child: Text(
                                "${widget.result.overview}",
                                style: TextStyle(color: Color(0xff343a40)),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff1f3f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  ///aka figma
                                  padding: const EdgeInsets.only(
                                      left: 16.0,
                                      bottom: 11,
                                      top: 9,
                                      right: 16),
                                  child: Row(
                                    children: [
                                      Text("Orçamento: " +
                                          snapshot.data!.budget.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xfff1f3f5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Wrap(
                                  children: [
                                    buildCompanies(
                                        snapshot.data!.productionCompanies),
                                  ],
                                ),
                              ),
                            ),

                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Text("Diretor"),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 16),
                                  child: buildDirector(
                                      snapshot.data!.credits!.crew),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text("Elenco"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 32),
                              child: buildCast(snapshot.data!.credits!.cast),
                            )

                            // Text(snapshot.data!.),
                          ],
                        );
                      }

                      return Container();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text buildHourMoview(String runtime) {
    int time = int.parse(runtime);

    return Text("Duração: " + getTimeString(time));
  }

  String getTimeString(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(
          2,
        )}h ${minutes.toString().padLeft(2, "0")}minutes';
  }

  Widget buildDetailPoster(MoviesResults result) {
    return FutureBuilder(
        future: streamImage.getMovieUrlPoster(result.posterPath ?? ""),
        builder: (context, AsyncSnapshot<String?> snapshot) {
          if (snapshot.connectionState != ConnectionState.waiting) {
            return ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)),
              child: CachedNetworkImage(
                imageUrl: snapshot.data!,
                fit: BoxFit.fitWidth,
              ),
            );
          } else {
            return Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }

  @override
  bool get wantKeepAlive => true;

  Widget buildDirector(List<Crew?>? crew) {
    Crew? director = crew!.firstWhere((element) => element?.job == "Director");
    return Text(director!.name ?? " - ");
  }

  buildCast(List<Cast?>? cast) {
    try {
      String castNames = "";
      cast!.forEach((element) {
        castNames = castNames + element!.name + ", ";
      });

      return Text(castNames.substring(
            0,
            castNames.length - 2,
          ) +
          ".");
    } catch (error) {
      return Container();
    }
  }

  buildCompanies(List<ProductionCompanies?>? productionCompanies) {
    try {
      String companiesNames = "Produtoras: ";
      productionCompanies!.forEach((element) {
        companiesNames = companiesNames + element!.name + ", ";
      });

      return Padding(
        ///aka figma
        padding:
            const EdgeInsets.only(left: 16.0, bottom: 11, top: 9, right: 16),
        child: Text(companiesNames.substring(
              0,
              companiesNames.length - 2,
            ) +
            "."),
      );
    } catch (error) {
      return Container();
    }
  }

  buildGenres() {
    try {
      return Container(
        height: 50,
        child: StreamBuilder(
            initialData: streamMovie.details.stream.value,
            stream: streamMovie.details.stream,
            builder: (context, AsyncSnapshot<DetailModel?> snapshot) {
              return Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            width: 0.4,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                              child: Text(snapshot.data!.genres[index]!.name)),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data!.genres.length,
                ),
              );
            }),
      );
    } catch (error) {
      return Container();
    }
  }
}
