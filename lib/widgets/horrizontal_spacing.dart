import 'package:flutter/material.dart';

class HorrizontalSpacing extends StatelessWidget {
  const HorrizontalSpacing(this.width, {super.key});
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
