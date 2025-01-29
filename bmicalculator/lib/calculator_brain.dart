import 'dart:math';

class CalculatorBrain{

  final int height;
  final int weight;

  double _bmi=0.0;

  CalculatorBrain(this.height, this.weight);

  String calculateBMI(){
    print(pow(height/100, 2));
    print(weight);
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);

  }

  String getResult(){
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'Normal weight';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
  String getInterpretation(){
    if (_bmi < 18.5) {
      return 'You have a Underweight body weight';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'You hava a normal body weight';
    } else if (_bmi >= 25 && _bmi < 30) {
      return ' You hava a Overweight body weight ';
    } else {
      return 'You have a obese body weight ';
    }
  }

}

