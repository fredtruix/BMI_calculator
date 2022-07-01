import 'package:bmi_calculator/screns/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/screns/icon_content.dart';
import 'package:bmi_calculator/component/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/component/bottombutton.dart';
import 'package:bmi_calculator/component/roundedicon1.dart';
import 'package:bmi_calculator/component/roundedicon2.dart';
import 'package:bmi_calculator/caculator_brain.dart';

enum genderEnum { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  dynamic selectedGender;
  int height = 50;
  int weight = 20;
  int age = 50;

  // Color maleCardColor = kinActiveCardColor;
  // Color femaleCardColor = kinActiveCardColor;

  // void upDateColor(genderEnum gender) {
  //   if (gender == genderEnum.male) {

  //     if (maleCardColor == kinActiveCardColor) {
  //       maleCardColor = kreuseAbleCardColor;
  //       femaleCardColor = kinActiveCardColor;
  //     } else {
  //       maleCardColor = kinActiveCardColor;
  //     }
  //   }
  //   //female card pressed
  //   else if (gender == genderEnum.female) {
  //     if (femaleCardColor == kinActiveCardColor) {
  //       femaleCardColor = kreuseAbleCardColor;
  //       maleCardColor = kinActiveCardColor;
  //     } else {
  //       femaleCardColor = kinActiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReUseAbleCard(
                    onPress: () {
                      setState(() {
                        selectedGender = genderEnum.male;
                      });
                    },
                    colour: selectedGender == genderEnum.male
                        ? kreuseAbleCardColor
                        : kinActiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseAbleCard(
                    onPress: () {
                      setState(() {
                        selectedGender = genderEnum.female;
                      });
                    },
                    colour: selectedGender == genderEnum.female
                        ? kreuseAbleCardColor
                        : kinActiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                )
              ],
            )),
            Expanded(
              child: ReUseAbleCard(
                  colour: kreuseAbleCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "HEIGH",
                        style: KlabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: kfontSize,
                          ),
                          const Text(
                            'cm',
                            style: KlabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: const Color(0xFFEB1555),
                          overlayColor: const Color(0x29EB1555),
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 10.0,
                          max: 200.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReUseAbleCard(
                    colour: kreuseAbleCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kfontSize,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUseAbleCard(
                    colour: kreuseAbleCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kfontSize,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton2(
                                icon: FontAwesomeIcons.minus,
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
            BottomButton(
              text: "CALCULATE",
              onpress: () {
                CalculatorBrain calc =
                    CalculatorBrain(0, height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ResultPage(
                      bmiResult: calc.calculateBmi(),
                      resultText: calc.getResult(),
                      bmiInterpretation: calc.getDescription());
                }));
              },
            )
          ],
        ));
  }
}
