import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget{
  final double? size;
  final Color? color;
  final Widget? widget;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Gradient? gradient;
  final BoxBorder? border;
  const CircleContainer({super.key, this.size, this.color, this.widget, this.padding, this.gradient, this.margin,  this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
    
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        shape: BoxShape.circle,
        border: border
      ),
      child: widget,
    );
  }

}