import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100.0, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Underweight';
    } else {
      return 'Normal';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Exercise more!';
    } else if (_bmi > 18.5) {
      return 'Good job!';
    } else {
      return 'Eat more!';
    }
  }
}
