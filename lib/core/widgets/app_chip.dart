import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppChip extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? radius;


  const AppChip({super.key, required this.child, this.color, this.radius});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:  color,
          borderRadius: BorderRadius.circular(radius ?? 10.r),
        ),
        child: child
      ),
    );
  }
}
