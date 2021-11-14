import 'package:cubos_imdb/model/movies_model.dart';
import 'package:cubos_imdb/widgets/pages/detail/page_details.dart';
import 'package:cubos_imdb/widgets/pages/home/page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildMaterialRippleEffect(
    BuildContext context, MoviesModel movieList, int index) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(10.0),
      splashColor: Colors.white24,
      hoverColor: Colors.white12,
      onTap: () {
        controllerHomePage.focusSearch.unfocus();
        Navigator.push(
            context,
            MaterialPageRoute(
                maintainState: true,
                settings: RouteSettings(name: "/details"),
                builder: (_) {
                  return PageDetail(movieList.results![index]);
                }));
      },
    ),
  );
}
