import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/model/categories_model.dart';
import 'package:cubos_imdb/widgets/pages/home/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart';

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
    super.build(context);
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
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
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
