import 'package:flutter/material.dart';
import 'package:affynity/theme/theme.dart';

class AffynityLogo extends StatelessWidget {
  final double size;
  final Color? color;

  const AffynityLogo({
    super.key,
    this.size = 32,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'affynity',
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w800,
        letterSpacing: -1,
        color: color ?? AffynityTheme.obsidian,
      ),
    );
  }
}