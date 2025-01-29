import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget{

  final IconData icon;
  final GestureTapCallback onPressed;

  const RoundIconButton({super.key, required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return  RawMaterialButton(
      onPressed: onPressed,
      shape: const CircleBorder(),
      elevation: 0.0,
      fillColor: const Color(0xFF4C4F5E),
      constraints:  const BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(icon),
    );
  }
}
