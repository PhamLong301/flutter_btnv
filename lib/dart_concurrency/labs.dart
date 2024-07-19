// import 'dart:async';
// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class streamLabs extends StatefulWidget {
//   const streamLabs({super.key});
//
//   @override
//   State<streamLabs> createState() => _streamLabsState();
// }
//
// class _streamLabsState extends State<streamLabs> {
//   @override
//   Widget build(BuildContext context) {
//     return lab2();
//   }
//
//   Scaffold lab5() {
//     return Scaffold(
//     appBar: AppBar(
//       title: Text('Lab 5'),
//     ),
//     body: Column(
//       children: [
//         ElevatedButton(
//           onPressed: batDauTaiFile,
//           child: Text('Download'),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: danhSachTienTrinh.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text('File ${index + 1}'),
//                 subtitle: LinearProgressIndicator(
//                   value: danhSachTienTrinh[index] / 100,
//                   backgroundColor: Colors.grey[200],
//                   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
//                 ),
//                 trailing: Text('${danhSachTienTrinh[index].toStringAsFixed(1)}%'),
//               );
//             },
//           ),
//         ),
//       ],
//     ),
//   );
//   }
//
//   Scaffold lab4(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//       title: Text('Lab 4'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CupertinoSlider(
//             value: sliderValue,
//             min: 1,
//             max: 10,
//             divisions: 9,
//             onChanged: trangThaiSlide,
//           ),
//           SizedBox(height: 20),
//           StreamBuilder<int>(
//             stream: slideController.stream,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(
//                   'Factorial: ${snapshot.data}',
//                   style: TextStyle(fontSize: 24),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }
//               return CircularProgressIndicator();
//             },
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () => hienThiLichSu(context),
//             child: Text('Lịch sử'),
//           ),
//         ],
//       ),
//     ),
//   );
//   }
//
//   Scaffold lab3(int phut, int giay) {
//     return Scaffold(
//     appBar: AppBar(
//       title: Text('Lab 3'),
//     ),
//     body: Center(
//       child: Text(
//         '${phut}p${giay}s',
//         style: TextStyle(fontSize: 24),
//       ),
//     ),
//   );
//   }
//
//   Scaffold lab2() {
//     return Scaffold(
//     appBar: AppBar(
//       title: Text('Lab 2'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: isDisabled ? null : startCountDown,
//             child: Text('Đếm ngược'),
//           ),
//           SizedBox(height: 20),
//           Text(
//             displayText,
//             style: TextStyle(fontSize: 24),
//           ),
//         ],
//       ),
//     ),
//   );
//   }
//
//   Scaffold lab1() {
//     return Scaffold(
//     appBar: AppBar(
//       title: Text('Lab 1'),
//     ),
//     body: Center(
//       child: StreamBuilder<int>(
//         stream: countController.stream,
//         initialData: 1,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return Text(
//               'Value: ${snapshot.data}',
//               style: TextStyle(fontSize: 24),
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           }
//           return CircularProgressIndicator();
//         },
//       ),
//     ),
//   );
//   }
// }
