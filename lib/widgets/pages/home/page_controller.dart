import 'package:cubos_imdb/bloc/movie_stream.dart';
import 'package:cubos_imdb/interface/page_interface.dart';
import 'package:flutter/material.dart';

final controllerHomePage = PageHomeController();

class PageHomeController implements InterfacePageController {
  var gridViewController = ScrollController();
  TextEditingController controllerSearch = TextEditingController();
  FocusNode focusSearch = FocusNode();
  var currentPage = 1;

  @override
  void init() {
    gridViewController.addListener(() {
      if (gridViewController.position.atEdge) {
        if (gridViewController.position.pixels == 0) {
          /// add pull to refresh? no time
        } else {
          currentPage++;
          streamMovie.listCurrentTheatersMovie(nextPage: currentPage);
        }
      }
    });
  }

  @override
  void dispose() {
    gridViewController.dispose();
    currentPage = 0;
  }
}
