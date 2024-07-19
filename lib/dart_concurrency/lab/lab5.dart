import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_btvn/mvvm_exercise/model/lab5_model.dart';
import 'package:flutter_btvn/mvvm_exercise/view_model/lab5_view_model.dart';

class Lab5Screen extends StatefulWidget {
  const Lab5Screen({super.key});

  @override
  State<Lab5Screen> createState() => _Lab5ScreenState();
}

class _Lab5ScreenState extends State<Lab5Screen> {
  // final List<StreamController<double>> progressController =
  //     List.generate(10, (index) => StreamController<double>());
  //
  // Future<void> downloadFile(StreamController<double> progress) async{
  //   final radom = Random();
  //   int thoiGianTai = radom.nextInt(6) + 10;
  //
  //   for(int i = 0; i <= thoiGianTai; i++){
  //     await Future.delayed(Duration(seconds: 1));
  //     final tienTrinh = (i  / thoiGianTai) * 100;
  //     progress.add(tienTrinh);
  //   }
  //   progress.close();
  // }
  //
  // void batDauTai(){
  //   for(var controller in progressController){
  //     downloadFile(controller);
  //   }
  // }

  final DownloadViewModel downloadViewModel = DownloadViewModel();

  @override
  void dispose() {
    // for(var controller in progressController){
    //   controller.close();
    // }
    downloadViewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Download Manager'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: downloadViewModel.startDownload,
              child: Text('Download'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: downloadViewModel.progressControllers.length,
                itemBuilder: (context, index) {
                  return StreamBuilder<DownloadProgress>(
                    stream: downloadViewModel.progressStreams[index],
                    initialData: DownloadProgress(index: index, progress: 0.0),
                    builder: (context, snapshot) {
                      final data = snapshot.data?.progress ?? 0;
                      return ListTile(
                        title: Text('File ${index + 1}'),
                        subtitle: LinearProgressIndicator(
                          value: data / 100,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          backgroundColor: Colors.grey[300],
                        ),
                        trailing: Text('${data.toStringAsFixed(2)}%'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
