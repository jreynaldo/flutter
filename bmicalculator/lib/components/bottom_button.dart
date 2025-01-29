import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String buttonTitle;
  const BottomButton({
    super.key,
    required this.theme, required this.onTap, required this.buttonTitle,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: theme.colorScheme.secondary,
        margin: const EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child:   Center(child:  Text(buttonTitle, style: kLargeButtonTextStyle,)),
      ),
    );
  }
}