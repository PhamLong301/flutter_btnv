import 'package:flutter/material.dart';
import 'package:flutter_btvn/screens/man_hinh2.dart';

class ManHinh1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Man 1'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ManHinh2(argument: 'Man 1 sang Man 2'),
                ),
              );
            },
            child: Text('Sang Man 2'),
          ),
        ),
      ),
    );
  }
}