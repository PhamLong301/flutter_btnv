import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exercise_1 extends StatelessWidget {
  Exercise_1({super.key});

  final List<Keno> statistics = [
    Keno('Lẻ', 5),
    Keno('Hoà CL', 3),
    Keno('Chẵn', 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tạo giao diện sau',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Keno là một loại hình chơi xổ số của Vietlott',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ...statistics.map((keno) => KenoStat(keno)).toList(),
          ],
        ),
      ),
    );
  }
}

class Keno {
  final String text;
  final int count;

  Keno(this.text, this.count);
}

class KenoStat extends StatelessWidget {
  final Keno keno;

  KenoStat(this.keno);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              keno.text,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 4 ,
            child: Row(
              children: [
                Container(
                  width: 30.0 * keno.count, // Width is 10 times the count
                  height: 20.0, // Height of the container
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '${keno.count} lần',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
