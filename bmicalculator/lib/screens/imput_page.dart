import 'package:bmicalculator/calculator_brain.dart';
import 'package:bmicalculator/genere.dart';
import 'package:bmicalculator/screens/result_page.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:bmicalculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 120;
  int weight = 50;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.colorScheme.primary,
        appBar: AppBar(
          title: Text('BMI CALCULATOR', style: theme.textTheme.headlineLarge,),
          backgroundColor: theme.colorScheme.primary,


        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveContainerColor,
                    cardChild: IconContent(
                      theme: theme,
                      iconData: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  )),
                  Expanded(
                      child: ReusableCard(
                          onPress: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          colour: selectedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveContainerColor,
                          cardChild: IconContent(
                            theme: theme,
                            iconData: FontAwesomeIcons.venus,
                            label: 'FEMALE',
                          ))),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [Text('HEIGHT', style:  theme.textTheme.bodyLarge),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                              Text(height.toString(), style: kNumberTextStyle,),
                              Text('cm', style: kLableTextStyle,)
                            ],
                          ), SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTickMarkColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: kBottomContainerColor,
                                overlayColor: Color(0x29EB1555),
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                              ),
                            child: Slider(value: height.toDouble(),

                                inactiveColor: kInactiveSliderColor,
                                max: 220.0,
                            
                                min: 100, onChanged: (double newValue){
                                 setState(() {
                                   height = newValue.round();
                                   print('object');
                                 });
                                },),
                          )],
                        ),

                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('WEIGHT',  style: kLableTextStyle),
                            Text(weight.toString(),  style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon:  FontAwesomeIcons.minus, onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },),
                                const SizedBox( width: 10.0,),
                                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },)
                              ],
                            )

                          ],
                        ),

                  )),
                  Expanded(
                      child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('AGE',  style: kLableTextStyle),
                            Text(age.toString(),  style: kNumberTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon:  FontAwesomeIcons.minus, onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },),
                                const SizedBox( width: 10.0,),
                                RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },)
                              ],
                            )

                          ],
                        ),

                  )),
                ],
              ),
            ),
            BottomButton(theme: theme, onTap: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);

                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )));

            },buttonTitle: 'Calculate',)
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  _InputPageState();
}




