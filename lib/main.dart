import 'package:flutter/material.dart';
import 'package:flutter_btvn/dart_concurrency/future_ui.dart';
import 'package:flutter_btvn/dart_concurrency/lab/lab1.dart';
import 'package:flutter_btvn/dart_concurrency/lab/lab3.dart';
import 'package:flutter_btvn/dart_concurrency/lab/lab4.dart';
import 'package:flutter_btvn/dart_concurrency/lab/lab5.dart';
import 'package:flutter_btvn/dart_concurrency/labs.dart';
import 'package:flutter_btvn/exercise_2/exercise_1.dart';
import 'package:flutter_btvn/gridview_excercise/chess_board.dart';
import 'package:flutter_btvn/gridview_excercise/match_game.dart';
import 'package:flutter_btvn/login_screen/list_view_screen.dart';
import 'package:flutter_btvn/login_screen/login_screen.dart';
import 'package:flutter_btvn/manage_human/manage_human.dart';
import 'package:flutter_btvn/screens/man_hinh1.dart';
import 'package:flutter_btvn/state_exercise/state_exercise.dart';

import 'dart_concurrency/lab/lab2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          background: Colors.grey,
          primary: Colors.lightGreenAccent,
          secondary: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black
          )
        )
      ),
      home: Lab5Screen(),
    );
  }
}
