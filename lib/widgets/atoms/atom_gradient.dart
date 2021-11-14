import 'package:flutter/material.dart';

LinearGradient buildLinearGradientHome() {
  return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.1111],
      colors: [Colors.black, Colors.transparent]);
}

LinearGradient buildLinearGradientCard() {
  return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      stops: [0.0, 0.30],
      colors: [Colors.black, Colors.transparent]);
}
