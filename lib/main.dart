import 'package:flutter/material.dart';
import 'package:bmi_calculator/screns/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF151026),
        ),
        scaffoldBackgroundColor: const Color(0xFF151026),
      ),
      home: const InputPage(),
    );
  }
}
