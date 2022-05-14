import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'box.dart';
import 'cardContent.dart';
import 'constants.dart';
import 'results.dart';
import 'lastButton.dart';
import 'calculator.dart';

enum Gender {
  male,
  female,
}
int height = 120;
int weight = 65;
int age = 18;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardColor = kpreclickColor;
  Color femalecardColor = kpreclickColor;

  void change(Gender gender) {
    //1=male selected
    gender == Gender.male
        ? {malecardColor = krealColor, femalecardColor = kpreclickColor}
        : {femalecardColor = krealColor, malecardColor = kpreclickColor};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(
                //Icons.account_circle_rounded,
                Icons.electrical_services_rounded,
                color: Colors.white,
                size: 29,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: box(
                    color: malecardColor,
                    cardChild: cardContent(
                      icon: FontAwesomeIcons.mars,
                      text: 'Male',
                    ),
                    onpress: () {
                      setState(() {
                        change(Gender.male);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: box(
                    color: femalecardColor,
                    cardChild: cardContent(
                      icon: FontAwesomeIcons.venus,
                      text: 'Female',
                    ),
                    onpress: () {
                      setState(() {
                        change(Gender.female);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: box(
              color: krealColor,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBoldStyle,
                        ),
                        Text(
                          "cm",
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 110.0,
                      max: 200.0,
                      onChanged: (double newValue) {
                        setState(
                          () {
                            height = newValue.round();
                          },
                        );
                      },
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                    ),
                  ]),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: box(
                  color: krealColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kBoldStyle,
                          ),
                          Text(
                            "kg",
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                          SizedBox(
                            width: 25,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: box(
                  color: krealColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "AGE",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kBoldStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 25,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          lastButton(
              seen: 'CALCULATE',
              onTapp: () {
                calc Start = calc(weight: weight, height: height);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => results(
                          BMI: Start.calculate(),
                          res: Start.getResult(),
                          feedback: Start.feedback())),
                );
              })
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      disabledElevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      fillColor: Color(0x25EB1555),
    );
  }
}
