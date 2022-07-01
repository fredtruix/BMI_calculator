import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  final double _bmi;

  CalculatorBrain(
    this._bmi, {
    required this.height,
    required this.weight,
  });

  String calculateBmi() {
    double _bmi = weight / pow(height / 100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getDescription() {
    if (_bmi >= 25) {
      return "you have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "you have a normal body weight. Great job.";
    } else {
      return "you have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
