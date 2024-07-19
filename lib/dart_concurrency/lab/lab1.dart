import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_btvn/mvvm_exercise/view_model/lab1_view_model.dart';

class Lab1Screen extends StatefulWidget {
  const Lab1Screen({super.key});

  @override
  State<Lab1Screen> createState() => _Lab1ScreenState();
}

class _Lab1ScreenState extends State<Lab1Screen> {
  // final StreamController<int> countController = StreamController<int>();
  // int value = 1;

  // Future<void> tangGiaTri() async {
  //   while (value < 12) {
  //     await Future.delayed(Duration(seconds: 5));
  //     value++;
  //     countController.add(value);
  //   }
  // }

  late CounterViewModel counterViewModel;

  @override
  void initState() {
    // tangGiaTri();
    counterViewModel = CounterViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return lab1();
  }

  Scaffold lab1() {
    return Scaffold(
    appBar: AppBar(
      title: Text('Lab 1'),
    ),
    body: Center(
      child: StreamBuilder<int>(
        stream: counterViewModel.countStream,
        initialData: 1,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              'Value: ${snapshot.data}',
              style: TextStyle(fontSize: 24),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    ),
  );
  }
}
