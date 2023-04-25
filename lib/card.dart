import 'package:flutter/material.dart';

class BMICard extends StatelessWidget {
  final Color? color;
  final Widget? child;

  final VoidCallback? onTap;

  const BMICard({super.key, this.color, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? const Color(0xff1d1e33),
        ),
        child: child,
      ),
    );
  }
}
