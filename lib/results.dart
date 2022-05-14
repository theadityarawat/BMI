import 'package:bmi_calculator/box.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'lastButton.dart';

class results extends StatelessWidget {
  results({@required this.BMI, @required this.res, @required this.feedback});
  final String feedback;
  final String BMI;
  final String res;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              child: Text(
            'Your Score',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 45.0,
            ),
          )),
          Expanded(
              flex: 5,
              child: box(
                  color: krealColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        res,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 22.0,
                          fontFamily: 'DMSans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        BMI,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 75.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        feedback,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ))),
          lastButton(
            seen: 'RE-CALCULATE',
            onTapp: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
