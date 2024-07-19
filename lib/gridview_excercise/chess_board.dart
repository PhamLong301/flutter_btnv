import 'package:flutter/material.dart';

class ChessBoardScreen extends StatefulWidget {
  const ChessBoardScreen({super.key});

  @override
  State<ChessBoardScreen> createState() => _ChessBoardScreenState();
}

class _ChessBoardScreenState extends State<ChessBoardScreen> {
  final int oBanCo = 8;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Chess Board',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Center(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: oBanCo,
            ),
            itemBuilder: (context, index) {
              final x = index % oBanCo;
              final y = index ~/ oBanCo;
              final oCoDen = (x + y) % 2 == 0;
              return Container(
                color: oCoDen? Colors.black : Colors.white,
              );
            },
            itemCount: oBanCo * oBanCo,
          ),
        ),
      ),
    );
  }
}
