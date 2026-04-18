import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/enum/shifts_enum.dart';
import 'package:qerp_app/core/methods/shifts_method.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/calendar_entity.dart';

class CalendarDayItem extends StatelessWidget{
  final CalendarEntity calendarEntity;
  final bool isCurrentDay ;
   const CalendarDayItem({super.key, required this.calendarEntity, this.isCurrentDay = false });

   
  @override
  Widget build(BuildContext context) {

    final shift = ShiftsMethod.getShift(calendarEntity.shiftId);
    final  isNight = shift == ShiftsEnum.night;
    final iconPath = ShiftsMethod.getShiftIcon(shift);
    return Container(
      width: 45.w,
  height: 52.h,
      decoration: BoxDecoration(
        color: isCurrentDay? null: ShiftsMethod.getShiftColor(shift).withValues(alpha: isNight? 1.0: 0.1),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: .05),width: 0.5),
        borderRadius: BorderRadius.circular(5.r),
        gradient: isCurrentDay? AppColors.primaryGradient : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 24,
            spreadRadius: 1,
        offset: const Offset(0, 5),
          )
        ]
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(calendarEntity.day.toString(),style: TextStyles.textViewBold14.copyWith(color: isNight ||isCurrentDay ? AppColors.white : null),),
          if (iconPath.isNotEmpty) ...[
             AppIcons.icon(
              icon: iconPath,
              color: isNight ? AppColors.white : null,
              size: 12,
            ),
          ]
        ],
      ),
    );
  }

}