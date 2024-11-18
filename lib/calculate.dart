import 'package:flutter/material.dart';
import 'constants.dart';

class Calculate extends StatelessWidget {
  const Calculate(this.gender, this.height, this.weight, this.age);
  final gender;
  final height;
  final weight;
  final age;
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> result =
        interpretBMI(weight, height, age, gender) as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculation Result'),
      ),
      body: Center(
          child: Text(
              '${result['classification']}\nBMI: ${result['bmi'].toStringAsFixed(2)}',
              style: headerstyle,textAlign: TextAlign.center,)),
    );
  }

  double calculateBMI(int weight, int heightCm) {
    double heightM = heightCm / 100; // Convert height to meters
    return weight / (heightM * heightM);
  }

  Object interpretBMI(int weight, int heightCm, int age, String gender) {
    double bmi = calculateBMI(weight, heightCm);
    String classification;

    if (bmi < 18.5) {
      classification = 'Underweight';
    } else if (bmi < 24.9) {
      classification = 'Normal weight';
    } else if (bmi < 29.9) {
      classification = 'Overweight';
    } else {
      classification = 'Obesity';
    }
    return {
      'classification': classification,
      'bmi': bmi,
    };
  }
}
