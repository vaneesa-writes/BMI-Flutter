import 'package:bmi_calculator/allConstants.dart';
import 'package:bmi_calculator/components/ReusableContainer.dart';
import 'package:bmi_calculator/components/bottom_navigator.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

class Results_Page extends StatelessWidget {
  Results_Page(
      {required this.bmi, required this.result, required this.interpretation});
  String bmi, result, interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1D1E33),
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(15.0),
              child: Text(
                "Your Result",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableContainer(
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(35),
                      child: Text(
                        result,
                        style:
                            TextStyle(fontSize: 25.0, color: Colors.lightGreen),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      bmi,
                      style: TextStyle(
                          fontSize: 100.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      interpretation,
                      style: kLabelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomNavigator(
            text: 'Go Back',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => InputPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
