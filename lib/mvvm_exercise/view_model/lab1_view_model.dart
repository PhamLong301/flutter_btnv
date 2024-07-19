import 'dart:async';

class CounterViewModel{
  final StreamController<int> countController = StreamController<int>();
  int value = 1;

  Stream<int> get countStream => countController.stream;


  CounterViewModel(){
    tangGiaTri();
  }

  Future<void> tangGiaTri() async {
    while (value < 12) {
      await Future.delayed(Duration(seconds: 5));
      value++;
      countController.add(value);
    }
  }

  void dispose(){
    countController.close();
  }

}