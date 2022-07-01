import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/component/reuseable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/component/bottombutton.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String bmiInterpretation;
  const ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.bmiInterpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI calculator"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: kresultTitleTextstyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(3.0),
                child: ReUseAbleCard(
                  colour: kreuseAbleCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: resultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        bmiInterpretation,
                        style: kBMIInterpretation,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
                onpress: () {
                  Navigator.pop(context);
                },
                text: "RE-CALCULATE")
          ],
        ));
  }
}
