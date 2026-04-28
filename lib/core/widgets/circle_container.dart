import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget{
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? widget;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Gradient? gradient;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  const CircleContainer({super.key, this.size, this.color, this.widget, this.padding, this.gradient, this.margin,  this.border, this.width, this.height, this.shadow});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
    
      width: width?? size,
      height: height?? size,
      decoration:  BoxDecoration(
        color: color,
        gradient: gradient,
        boxShadow: shadow,
        shape: BoxShape.circle,
        border: border
      ),
      child: widget,
    );
  }

}