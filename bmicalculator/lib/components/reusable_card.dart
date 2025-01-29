import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {

  final Color colour;
   Widget? cardChild;
   GestureTapCallback? onPress;

   ReusableCard(
      {super.key, required this.colour,  this.cardChild, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10.0)),
        child: cardChild,
      ),
    );
  }
}
