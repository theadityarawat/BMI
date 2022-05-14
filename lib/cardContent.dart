import 'package:flutter/material.dart';

class cardContent extends StatelessWidget {
  cardContent({@required this.icon, @required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 85,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),
        )
      ],
    );
  }
}
