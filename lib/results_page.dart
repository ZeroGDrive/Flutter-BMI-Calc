import 'package:bmi_calculator/card.dart';
import 'package:bmi_calculator/footer_button.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Your Result',
                style: numberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BMICard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: resultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          FooterButton(
              label: 're-calculate',
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
