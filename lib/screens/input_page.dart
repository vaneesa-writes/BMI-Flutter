import 'package:bmi_calculator/components/round-icon_button.dart';
import 'package:bmi_calculator/components/value_units.dart';
import 'package:bmi_calculator/screens/results.dart';
import 'package:flutter/material.dart';

import '../allConstants.dart';
import '../calculator_brain.dart';
import '../components/IconContainer.dart';
import '../components/ReusableContainer.dart';
import '../components/bottom_navigator.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female, none }

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.none;
  double heightValue = 150.0;
  int weightValue = 50;
  int ageValue = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        iconData: IconData(0xe3c5, fontFamily: 'MaterialIcons'),
                        iconText: 'Male',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        iconData: IconData(0xe261, fontFamily: 'MaterialIcons'),
                        iconText: 'Female',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: kLabelTextStyle,
                          ),
                          Value_and_Units(value: heightValue, unit: "cm"),
                          Slider(
                            value: heightValue.toDouble(),
                            min: 120.0,
                            max: 250.0,
                            activeColor: Color(0xFFf5f5f5),
                            onChanged: (newValue) {
                              // log('$newValue');
                              setState(
                                () {
                                  heightValue = newValue.roundToDouble();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          Value_and_Units(
                              value: weightValue.toInt().toDouble(),
                              unit: 'kg'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(
                                    () {
                                      weightValue++;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(
                                    () {
                                      if (weightValue > 1) weightValue--;
                                    },
                                  );
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          Value_and_Units(
                              value: ageValue.toDouble(), unit: 'yrs'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(
                                    () {
                                      ageValue++;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(
                                    () {
                                      if (ageValue > 1) ageValue--;
                                    },
                                  );
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
            BottomNavigator(
              text: 'Calculate',
              onTap: () {
                CalculatorBrain cBrain = CalculatorBrain(
                    height: heightValue, weight: weightValue.toDouble());
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => Results_Page(
                        bmi: cBrain.calculateBMI(),
                        result: cBrain.getResult(),
                        interpretation: cBrain.getInterpretation()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
