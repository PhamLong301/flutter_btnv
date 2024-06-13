import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StateExercise extends StatefulWidget {
  const StateExercise({super.key});

  @override
  State<StateExercise> createState() => _StateExerciseState();
}

class _StateExerciseState extends State<StateExercise> {
  bool thaTim = false;
  int demSo = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Homework')),
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            setState(() {
                              thaTim = !thaTim;
                            });
                          });
                        },
                        icon: Icon(
                          (thaTim) ? Icons.favorite : Icons.favorite,
                          color: (thaTim) ? Colors.red : Colors.black,
                        ),
                      ),
                      Text('Like'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.comment),
                        onPressed: () {},
                      ),
                      Text('Comment'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                      Text('Share'),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text('currentCounter is: $demSo'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            demSo++;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
