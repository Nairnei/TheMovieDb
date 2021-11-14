import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubos_imdb/bloc/Image_stream.dart';
import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/model/details_model.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:cubos_imdb/widgets/molecules/molecule_card.dart';
import 'package:cubos_imdb/widgets/molecules/molecule_details.dart';
import 'package:cubos_imdb/widgets/pages/detail/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    streamMovie.getMovieDetailsByID({"movieId": widget.result.id});
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Container(
                        width: 88,
                        height: 40,
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_back_ios),
                                  Text("Voltar"),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("${widget.result.voteAverage}",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Color(0xff00384C))),
                      Text(
                        " / 10",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff868E96)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.result.title}",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff343A40)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Título original: ",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color(0xff5E6770))),
                      Text("${widget.result.originalTitle}",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xff5E6770))),
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
                                      child: Row(
                                        children: [
                                          Text("Ano: ",
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Color(0xff868E96))),
                                          Text(
                                              "${widget.result.releaseDate
                                                  .toString()
                                                  .split("-")
                                                  .first}",
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                  color: Color(0xff343A40))),
                                        ],
                                      ),
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
                              child: Text("Descrição",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff5E6770))),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 8.0, bottom: 20),
                              child: Text("${widget.result.overview}",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(0xff343A40))),
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
                                      Text("Orçamento: ",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                              color: Color(0xff868E96))),
                                      Text(snapshot.data!.budget.toString(),
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Color(0xff343A40))),
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
                                  child: Text("Diretor",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xff5E6770))),
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
                              child: Text("Elenco",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                      color: Color(0xff5E6770))),
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

  @override
  bool get wantKeepAlive => true;

}
