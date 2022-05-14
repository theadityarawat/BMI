import 'package:flutter/material.dart';
import 'input.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'box.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Color(0xFF2A2A2A),
            titleTextStyle: TextStyle(
              fontFamily: 'DMSans',
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
            centerTitle: true,
            elevation: 0,
          ),
          fontFamily: 'DMSans',
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Color(0xFF2A2A2A),
          accentColor: Color(0xFFE6DFF1),
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
