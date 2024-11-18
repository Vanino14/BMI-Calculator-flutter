import 'package:flutter/material.dart';

class Reuseable_container extends StatelessWidget {
  const Reuseable_container(this.onPress,this.colour, this.cardChild,);
  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(10.0),
        child: cardChild,
      ),
    );
  }
}