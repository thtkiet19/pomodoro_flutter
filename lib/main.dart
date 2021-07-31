import 'package:flutter/material.dart';
import 'package:pomodoro/SelectTime.dart';
import 'package:pomodoro/pomodoro.dart';

void main() {
  runApp(MaterialApp(
    //home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => SelectTimer(),
      '/home': (context) => pomodoro(),
      // '/location':(context) => Choose_location(),
    },
  ));
}
