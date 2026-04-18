import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/widgets/app_shimmer.dart';
import 'package:qerp_app/core/widgets/shimmer_shape.dart';

class LoadingCalendarItem extends StatelessWidget{
  const LoadingCalendarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ShimmerShape(
      margin: EdgeInsets.only(left: 10.w,right: 10.w, top: 10.w,bottom: 50.h),
      radius: 10.r,width: double.infinity,height: double.infinity,));
  }

}