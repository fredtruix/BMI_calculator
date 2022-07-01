import 'package:flutter/material.dart';



class RoundedIconButton2 extends StatelessWidget {
  final IconData icon;
  final dynamic onPress;

  const RoundedIconButton2({Key? key, required this.icon, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPress,
    );
  }
}
