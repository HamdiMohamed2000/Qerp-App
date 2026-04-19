import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/widgets/circle_container.dart';

class AppSwitch extends StatelessWidget {
  final bool value;
  final void Function(bool)? onChanged;
  const AppSwitch({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
  onTap: () => onChanged!(!value),
  child: AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    width: 50.w,
    height: 30.h,
    padding: EdgeInsetsDirectional.only(top: 2.h,bottom: 2.h,start: 5.w,end: 5.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: value ? Theme.of(context).primaryColor.withValues(alpha: 0.2) : AppColors.lightGray.withValues(alpha: 0.5),
    ),
    child: AnimatedAlign(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      child: CircleContainer(
       
        size: 20,
        gradient: AppColors.primaryGradient,
      ),
    ),
  ),
);
  }
}
