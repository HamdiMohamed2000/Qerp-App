import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/methods/shifts_method.dart';
import 'package:qerp_app/core/widgets/circle_container.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/shift_entity.dart';

class ShiftItem extends StatelessWidget{
  final List<ShiftEntity> shiftEntity;
  final int index;
  const ShiftItem({super.key, required this.shiftEntity, required this.index});

  @override
  Widget build(BuildContext context) {

    final shift = ShiftsMethod.getShift(shiftEntity[index].id.toString());
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: AppColors.white.withValues(alpha: 0.1),
            border: BorderDirectional(start: BorderSide(color:ShiftsMethod.getShiftColor(shift),width: 7))
          ),
          child: Row(
            spacing: 5.w,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleContainer(
                size: 30,
                color: ShiftsMethod.getShiftColor(shift).withValues(alpha: 0.1),
                widget: Center(child: AppIcons.icon(icon: ShiftsMethod.getShiftIcon(shift),size: 18)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5.h,
                children: [
                  Text(ShiftsMethod.getShiftText(shift),style: TextStyles.textViewMedium10,),
                  Text("${shiftEntity[index].startTime!} - ${shiftEntity[index].endTime!}",style: TextStyles.textViewRegular8.copyWith(color: Theme.of(context).hintColor),)
                ],
              )
            ],
          ),
        
        ),
      ),
    );
  }

}