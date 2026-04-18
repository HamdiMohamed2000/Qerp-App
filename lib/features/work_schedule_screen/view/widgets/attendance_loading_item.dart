import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/widgets/app_shimmer.dart';
import 'package:qerp_app/core/widgets/shimmer_shape.dart';

class AttendanceLoadingItem extends StatelessWidget{
  const AttendanceLoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      itemCount: 20,
      itemBuilder: (context,index){
      return AppShimmer(child: ShimmerShape(
        width: double.infinity,
        height: 200.h,
        radius: 15.r,
    
      ));
    
    },separatorBuilder: (context, builder) => SizedBox(height: 10.h) );
  }

}