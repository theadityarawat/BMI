import 'package:flutter/material.dart';

class box extends StatelessWidget {
  box({@required this.color, this.cardChild, this.onpress});
  final Color color;
  final Widget cardChild;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
