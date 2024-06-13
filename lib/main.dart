import 'package:flutter/material.dart';
import 'package:flutter_btvn/exercise_2/exercise_1.dart';
import 'package:flutter_btvn/login_screen/list_view_screen.dart';
import 'package:flutter_btvn/login_screen/login_screen.dart';
import 'package:flutter_btvn/screens/man_hinh1.dart';
import 'package:flutter_btvn/state_exercise/state_exercise.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}


