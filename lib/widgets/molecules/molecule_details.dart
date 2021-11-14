import 'package:cached_network_image/cached_network_image.dart';
import 'package:cubos_imdb/bloc/Image_stream.dart';
import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/model/details_model.dart';
import 'package:cubos_imdb/model/movies_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Row buildHourMoview(String runtime) {
  int time = int.parse(runtime);

  return Row(
    children: [
      Text("Duração",
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xff868E96))),
      Text(getTimeString(time),
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xff343A40))),
    ],
  );
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

Widget buildDirector(List<Crew?>? crew) {
  Crew? director = crew!.firstWhere((element) => element?.job == "Director");
  return Text(director!.name ?? " - ",
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600, fontSize: 12, color: Color(0xff343A40)));
}

buildCast(List<Cast?>? cast) {
  try {
    String castNames = "";
    cast!.forEach((element) {
      castNames = castNames + element!.name + ", ";
    });

    return Text(
        castNames.substring(
              0,
              castNames.length - 2,
            ) +
            ".",
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Color(0xff343A40)));
  } catch (error) {
    return Container();
  }
}

buildCompanies(List<ProductionCompanies?>? productionCompanies) {
  try {
    String companiesNames = "";
    productionCompanies!.forEach((element) {
      companiesNames = companiesNames + element!.name + ", ";
    });

    return Padding(
      ///aka figma
      padding: const EdgeInsets.only(left: 16.0, bottom: 11, top: 9, right: 16),
      child: Wrap(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text("Produtoras: ",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Color(0xff868E96))),
          Text(
              companiesNames.substring(
                    0,
                    companiesNames.length - 2,
                  ) +
                  ".",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Color(0xff343A40)))
        ],
      ),
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
                          border:
                              Border.all(width: 1, color: Color(0xffE9ECEF)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 4.0, bottom: 4, left: 10, right: 10),
                          child: Center(
                            child: Text(
                                snapshot.data!.genres[index]!.name
                                    .toString()
                                    .toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xff5E6770))),
                          ),
                        ),
                      ));
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
