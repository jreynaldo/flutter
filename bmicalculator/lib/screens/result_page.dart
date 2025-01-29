import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(
          padding: EdgeInsets.all(15.0),
          child: Text('Your Result', style: kTitleTextStyle,),
          alignment: Alignment.bottomLeft,
        )),
        Expanded(flex: 5,
        child: ReusableCard(colour: kActiveCardColor, onPress: (){},
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(resultText, style: resultTextStyle,),
            Text(bmiResult, style: kIBMTextStyle,),
            Text(interpretation, style: kBodyTextStyle, textAlign: TextAlign.center,),

          ],
        ),
        )),
        BottomButton(theme: theme, onTap: () {

          Navigator.pop(context);

        },buttonTitle: 'Re-calculate',)
      ],
    ),
    );
  }
}
