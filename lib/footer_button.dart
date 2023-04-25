import 'package:flutter/material.dart';

import 'constants.dart';

class FooterButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const FooterButton({super.key, required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: const Color(0xffeb1555),
        margin: const EdgeInsets.only(top: 10),
        height: bottomContainerHeight,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text(label.toUpperCase(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
