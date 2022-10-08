import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height = 150, this.weight = 50});
  final double height;
  final double weight;
  double _bmi = 0.0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25)
      return 'Overweight';
    else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5)
      return 'You have a normal body weight. Good job!';
    else
      return 'You have a 10 .er than normal body weight. You can eat a bit more. ';
  }
}
