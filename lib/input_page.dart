import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';

import 'card.dart';
import 'card_icon.dart';
import 'constants.dart';
import 'footer_button.dart';
import 'results_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? _selectedGender = Gender.female;
  int _height = 180;
  int _weight = 60;
  int _age = 20;

  void updateGender(Gender gender) {
    setState(() {
      _selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BMICard(
                      onTap: () => updateGender(Gender.male),
                      color: _selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      child: CardIcon(
                        icon: Icons.male,
                        label: 'male',
                        color: _selectedGender == Gender.male
                            ? Colors.white
                            : null,
                      ),
                    ),
                  ),
                  Expanded(
                    child: BMICard(
                      onTap: () => updateGender(Gender.female),
                      color: _selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      child: CardIcon(
                        icon: Icons.female,
                        label: 'female',
                        color: _selectedGender == Gender.female
                            ? Colors.white
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: BMICard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: labelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          _height.toString(),
                          style: numberTextStyle,
                        ),
                        const Text(
                          'cm',
                          style: labelTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Slider(
                      value: _height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          _height = value.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: labelTextStyle,
                          ),
                          Text(_weight.toString(), style: numberTextStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    _weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _weight++;
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
                    child: BMICard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: labelTextStyle,
                          ),
                          Text(_age.toString(), style: numberTextStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    _age--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FooterButton(
              label: 'calculate',
              onPressed: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: _height, weight: _weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                              bmiResult: calc.calculateBMI(),
                              resultText: calc.getResult(),
                              interpretation: calc.getInterpretation(),
                            )));
              },
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback? onPressed;

  const RoundIconButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      fillColor: const Color(0xff4c4f5e),
      elevation: 0,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      child: icon,
    );
  }
}
