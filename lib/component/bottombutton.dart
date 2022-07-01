import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final dynamic  onpress;
  final String text;

  const BottomButton({Key? key, required this.onpress, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: ktextStyleLabel,
        )),
        color: kbuttomContainerColor,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottonContainerHeight,
        padding: const EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}
