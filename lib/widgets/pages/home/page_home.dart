import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/widgets/atoms/atom_gradient.dart';
import 'package:cubos_imdb/widgets/organism/organism_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page_controller.dart';

class PageHome extends StatefulWidget {
  const PageHome({
    Key? key,
  }) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Material(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 24, bottom: 24, right: 20, left: 20),
                  child: Container(
                      child: Text(
                    "Filmes",
                    style: GoogleFonts.montserrat(
                        color: Color(0xff343A40),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 16, right: 20, left: 20),
                  child: TextFormField(
                    controller: controllerHomePage.controllerSearch,
                    focusNode: controllerHomePage.focusSearch,
                    onFieldSubmitted: (value) {
                      streamMovie.searchMovieWithQuery({"searchQuery": value});
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Color(0xfff1f3f5),
                      filled: true,
                      contentPadding: EdgeInsets.only(top: 18, bottom: 16),
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Pesquise filmes',
                      hintStyle: GoogleFonts.montserrat(
                          color: Color(0xff5e6770),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return buildLinearGradientHome().createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstOut,
                            child: buildStreamBuilderMovies(
                                gridController:
                                    controllerHomePage.gridViewController),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 24,
                            width: 54,
                            child: buildGenres(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
