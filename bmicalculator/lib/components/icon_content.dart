import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    super.key,
    required this.theme,
    required this.iconData,
    required this.label,
  });

  final ThemeData theme;
  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall,
        )
      ],
    );
  }
}
