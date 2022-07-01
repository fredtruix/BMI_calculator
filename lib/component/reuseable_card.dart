import 'package:flutter/material.dart';


class ReUseAbleCard extends StatelessWidget {

  final Color colour;
  final Widget cardChild;
  final dynamic onPress;

  const ReUseAbleCard({Key? key, required final this.colour, required this.cardChild, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
