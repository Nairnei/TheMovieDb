import 'package:cubos_imdb/widgets/pages/home/page_home.dart';
import 'package:flutter/material.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CUBOS TMDB',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PageHome());
  }
}
