import 'package:flutter/material.dart';
import 'dart:math';

class calc {
  calc({@required this.weight, @required this.height});

  final int weight;
  final int height;
  double _bmi;
  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return 'OVERWEIGHT';
    else if (_bmi > 18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String feedback() {
    if (_bmi >= 25)
      return 'Maintain regular Exercise, and shed off the extra mass';
    else if (_bmi > 18.5)
      return 'Yay! You are fit with a healthy routine. Keep it Up';
    else
      return 'Might need to gain some fat, go eat your favourite meal';
  }
}
