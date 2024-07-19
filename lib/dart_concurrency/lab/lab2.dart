import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_btvn/mvvm_exercise/view_model/lab2_view_model.dart';

class Lab2Screen extends StatefulWidget {
  const Lab2Screen({super.key});

  @override
  State<Lab2Screen> createState() => _Lab2ScreenState();
}

class _Lab2ScreenState extends State<Lab2Screen> {

  // late StreamController<String> textController = StreamController<String>();
  // late StreamController<bool> buttonController = StreamController<bool>.broadcast();
  late CountDownViewModel countDownViewModel;

  @override
  void initState() {
    countDownViewModel = CountDownViewModel();
    super.initState();
  }

  @override
  void dispose() {
    // textController.close();
    // buttonController.close();
    countDownViewModel.dispose();
    super.dispose();
  }

  // void batDauDemThoiGian() async{
  //   buttonController.add(false);
  //   for(int i = 3; i >= 0; i--){
  //     await Future.delayed(Duration(seconds: 1));
  //     if(i > 0){
  //       textController.add('${i}');
  //     }else {
  //       textController.add('Done');
  //     }
  //   }
  //   buttonController.add(true);
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Countdown Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<bool>(
              stream: countDownViewModel.buttonStream,
              initialData: true,
              builder: (context, snapshot) {
                return ElevatedButton(
                  onPressed: snapshot.data == true ? countDownViewModel.batDauDemThoiGian : null,
                  child: Text('Start Countdown'),
                );
              },
            ),
            SizedBox(height: 20),
            StreamBuilder<String>(
              stream: countDownViewModel.textStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data ?? '',
                    style: TextStyle(fontSize: 24),
                  );
                }
                return Container(); // Hiển thị trống nếu không có dữ liệu
              },
            ),
          ],
        ),
      ),
    );
  }
}
