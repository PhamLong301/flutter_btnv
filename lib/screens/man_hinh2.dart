import 'package:flutter/material.dart';
import 'package:flutter_btvn/screens/man_hinh3.dart';

class ManHinh2 extends StatelessWidget {
  final String argument;

  ManHinh2({required this.argument});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Man 2'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text(argument)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManHinh3()),
                  );
                },
                child: Text('Sang Man 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}