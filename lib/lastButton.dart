import 'package:flutter/material.dart';
import 'constants.dart';
import 'results.dart';

class lastButton extends StatelessWidget {
  lastButton({@required this.seen, @required this.onTapp});
  String seen;
  Function onTapp;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              child: Text(
                seen,
                style: kLabelTextStyle,
              ),
              onTap: () {
                onTapp();
              }),
        ],
      ),
      decoration: BoxDecoration(color: Color(0xFFF7FF82)),
      height: 80,
      width: double.maxFinite,
    );
  }
}
