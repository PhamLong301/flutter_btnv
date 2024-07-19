import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_btvn/mvvm_exercise/view_model/lab4_view_model.dart';

class Lab4Screen extends StatefulWidget {
  const Lab4Screen({super.key});

  @override
  State<Lab4Screen> createState() => _Lab4ScreenState();
}

class _Lab4ScreenState extends State<Lab4Screen> {
  // StreamController<double> sliderController = StreamController<double>();
  // StreamController<int> giaiThuaController = StreamController<int>();
  // StreamController<List<int>> historyController =
  //     StreamController<List<int>>.broadcast();

  // List<int> history = [];
  // double currentValue = 1.0;

  late FactorialViewModel factorialViewModel = FactorialViewModel();

  @override
  void initState() {
    super.initState();
    // sliderController.stream.listen((event) {
    //   final int value = event.toInt();
    //   final int result = tinhGiaiThua(value);
    //   giaiThuaController.add(result);
    //   history.add(result);
    //   historyController.add(history);
    // });
  }

  @override
  void dispose() {
    // sliderController.close();
    // giaiThuaController.close();
    // historyController.close();
    super.dispose();
  }

  // int tinhGiaiThua(int num) {
  //   if (num <= 1) return 1;
  //   return num * tinhGiaiThua(num - 1);
  // }

  void showHistory(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: factorialViewModel.history.map((item) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Factorial: $item'),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4'),
      ),
      body: Center(
        child: Column(
          children: [
            StreamBuilder<double>(
              stream: factorialViewModel.sliderStream,
              initialData: 1,
              builder: (context, snapshot) {
                return CupertinoSlider(
                  value: snapshot.data!,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  onChanged: factorialViewModel.onSliderChange,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<int>(
              stream: factorialViewModel.factorialStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    'Giai thừa: ${snapshot.data}',
                    style: TextStyle(fontSize: 24),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed:() =>  showHistory(context),
                child: const Text('Lịch sử')),
          ],
        ),
      ),
    );
  }
}
