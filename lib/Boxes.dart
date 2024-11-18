

import 'package:flutter/material.dart';

class Boxes extends StatelessWidget {

  final IconData icon;
  final String text;
  const Boxes(this.icon,this.text);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 10.0),
        Text(
          '$text',
          style: TextStyle(
            fontSize: 18.0,
          ),
        )
      ],
    );
  }
}
