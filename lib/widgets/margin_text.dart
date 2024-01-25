import 'package:flutter/material.dart';

class MarginText extends StatelessWidget {
  const MarginText({
    this.child,
    super.key,
    this.h = 0.0,
    this.v = 0.0,
  })  : text = null,
        style = null;

  const MarginText.t(
    this.text, {
    super.key,
    this.h = 0.0,
    this.v = 0.0,
    this.style,
  }) : child = null;

  final double v;
  final double h;
  final Widget? child;
  final String? text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: child ?? Text(text ?? '', style: style),
    );
  }
}
