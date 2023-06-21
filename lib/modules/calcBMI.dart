// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:bmi_calc/pages/home.dart';

class CalcBMI {
  final int height;
  final int weight;
  final int age;
  final GenderSelection gender;

  CalcBMI({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  }) : _bmi = 0.0;

  double _bmi;

  String calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResult() {
    if (gender == GenderSelection.Male) {
      if (_bmi >= 30) {
        return 'Obese';
      } else if (_bmi >= 25) {
        return 'Overweight';
      } else if (_bmi >= 18.5) {
        return 'Normalweight';
      } else {
        return 'Underweight';
      }
    } else {
      if (_bmi >= 30) {
        return 'Obese';
      } else if (_bmi >= 24) {
        return 'Overweight';
      } else if (_bmi >= 18.5) {
        return 'Normalweight';
      } else {
        return 'Underweight';
      }
    }
  }

  String getInterpretation() {
    if (gender == GenderSelection.Male) {
      if (_bmi >= 30) {
        return 'You have a higher risk of developing health issues. Consider consulting a doctor.';
      } else if (_bmi >= 25) {
        return 'You are at a higher weight than normal. Try to exercise more and maintain a balanced diet.';
      } else if (_bmi >= 18.5) {
        return 'You have a normal body weight. Good job!';
      } else {
        return 'You have a lower weight than normal. You can eat a bit more to gain weight.';
      }
    } else {
      if (_bmi >= 30) {
        return 'You have a higher risk of developing health issues. Consider consulting a doctor.';
      } else if (_bmi >= 24) {
        return 'You are at a higher weight than normal. Try to exercise more and maintain a balanced diet.';
      } else if (_bmi >= 18.5) {
        return 'You have a normal body weight. Good job!';
      } else {
        return 'You have a lower weight than normal. You can eat a bit more to gain weight.';
      }
    }
  }
}


