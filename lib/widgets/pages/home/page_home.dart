import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/model/categories_model.dart';
import 'package:cubos_imdb/widgets/pages/organism/organism_home.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

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
                    style: TextStyle(
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
                      hintStyle: TextStyle(
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
                              return buildLinearGradient().createShader(
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
                            child: StreamBuilder(
                                stream: streamMovie.categories.stream,
                                initialData: streamMovie.categories.value,
                                builder: (context,
                                    AsyncSnapshot<CategoriesModel?> snapshot) {
                                  if (snapshot.connectionState !=
                                      ConnectionState.waiting) {
                                    if (snapshot.data != null)
                                      return ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 14),
                                        itemBuilder: (context, index) {
                                          return BuildChipFilter(
                                              snapshot.data!.genres![index]);
                                        },
                                        itemCount:
                                            snapshot.data!.genres!.length,
                                      );
                                    return Container();
                                  } else {
                                    return Container();
                                  }
                                }),
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

  LinearGradient buildLinearGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.1111],
        colors: [Colors.black, Colors.transparent]);
  }
}

class BuildChipFilter extends StatefulWidget {
  final Genres genre;

  BuildChipFilter(
    this.genre, {
    Key? key,
  }) : super(key: key);

  @override
  _BuildChipFilterState createState() => _BuildChipFilterState();
}

class _BuildChipFilterState extends State<BuildChipFilter>
    with AutomaticKeepAliveClientMixin {
  BehaviorSubject<bool> isSelected = BehaviorSubject.seeded(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isSelected.sink.add(!isSelected.value);
        streamMovie.addFilter(widget.genre.id);
        controllerHomePage.controllerSearch.clear();
        streamMovie.listDiscoverGenres({"genresId": streamMovie.getFilter()});
      },
      child: StreamBuilder<bool>(
          stream: isSelected,
          initialData: isSelected.value,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: snapshot.data! ? Color(0xff00384c) : Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: Center(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12),
                  child: Text(
                    widget.genre.name,
                    style: TextStyle(
                        color:
                            snapshot.data! ? Colors.white : Color(0xff00384c)),
                  ),
                )),
              ),
            );
          }),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
