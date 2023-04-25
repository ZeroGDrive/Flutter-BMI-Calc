import 'package:flutter/material.dart';

import 'constants.dart';

class CardIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;

  const CardIcon({
    super.key,
    required this.icon,
    required this.label,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
          color: color ?? const Color(0xff8d8e98),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label.toUpperCase(),
          style: labelTextStyle,
        )
      ],
    );
  }
}
