import 'dart:async';

import 'package:flutter_btvn/mvvm_exercise/model/lab4_model.dart';

class FactorialViewModel {
  final FactorialModel _model = FactorialModel();
  final StreamController<double> sliderController = StreamController<double>.broadcast();
  final StreamController<int> factorialController = StreamController<int>.broadcast();
  final List<int> historys = [];
  Stream<double> get sliderStream => sliderController.stream;
  Stream<int> get factorialStream => factorialController.stream;
  List<int> get history => historys;

  void onSliderChange(double value) {
    int fact = _model.calculateFactorial(value.toInt());
    if (historys.contains(fact)) {
      return;
    }
    historys.add(fact);
    factorialController.add(fact);
    sliderController.add(value);
  }

  void dispose() {
    sliderController.close();
    factorialController.close();
  }
}