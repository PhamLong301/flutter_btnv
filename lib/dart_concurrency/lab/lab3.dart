import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_btvn/mvvm_exercise/view_model/lab3_view_model.dart';

class Lab3Screen extends StatefulWidget {
  const Lab3Screen({super.key});

  @override
  State<Lab3Screen> createState() => _Lab3ScreenState();
}

class _Lab3ScreenState extends State<Lab3Screen> {
  // late final StreamController<String> timeController =
  //     StreamController<String>();

  late CountTimeViewModel countTime;

  @override
  void initState() {
    // demThoiGian();
    countTime = CountTimeViewModel();
    countTime.demThoiGian();
    super.initState();
  }

  // void demThoiGian() async {
  //   int thoiGianTroiQua = 0;
  //   while (thoiGianTroiQua < 180) {
  //     int phut = thoiGianTroiQua ~/ 60;
  //     int giay = thoiGianTroiQua % 60;
  //     timeController.add("${phut}p${giay}s");
  //     thoiGianTroiQua++;
  //   }
  //   timeController.close();
  // }

  @override
  void dispose() {
    // timeController.close();
    countTime.dipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 3'),
      ),
      body: Center(
        child: StreamBuilder<String>(
          stream: countTime.timeStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("0p0s");
            } else if (snapshot.hasData) {
              return Text(
                snapshot.data ?? '0p0s',
                style: const TextStyle(fontSize: 40),
              );
            } else if(snapshot.hasError){
              return const Text('Error');
            }else{
              return const Text('Completed');
            }
          },
        ),
      ),
    );
  }
}
