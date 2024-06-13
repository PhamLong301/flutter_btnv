import 'package:flutter/material.dart';
import 'package:flutter_btvn/screens/man_hinh1.dart';

class ManHinh3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Man 3'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManHinh1()),
                  );
                },
                child: Text('Sang Man 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ManHinh1()),
                        (route) => false,
                  );
                },
                child: Text('Sang Man 1 va Xoa cac route truoc'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}