import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/enum/shifts_enum.dart';
import 'package:qerp_app/core/extentions/context_helper.dart';
import 'package:qerp_app/core/methods/shifts_method.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/calendar_entity.dart';

class CalendarDayItem extends StatelessWidget{
  final CalendarEntity calendarEntity;
  final bool isCurrentDay ;
   const CalendarDayItem({super.key, required this.calendarEntity, this.isCurrentDay = false });

   
  @override
  Widget build(BuildContext context) {

    final shift = ShiftsMethod.getShift(calendarEntity.shiftId);
    final iconPath = ShiftsMethod.getShiftIcon(shift);
    final isOnLeave = calendarEntity.isOnLeave;
    final isNightShift = ShiftsMethod.getShift(calendarEntity.shiftId) == ShiftsEnum.night;

    return Container(
      width: 43.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: isCurrentDay? null: isOnLeave? AppColors.green.withValues(alpha:  0.1) : ShiftsMethod.getShiftColor(shift).withValues(alpha: isNightShift?1: 0.1),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: context.isDarkMode? 0.05 :0.5),width: 1),
        borderRadius: BorderRadius.circular(10.r),
        gradient: isCurrentDay? AppColors.primaryGradient : null,
       
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(calendarEntity.day.toString(),style: TextStyles.textViewBold14.copyWith(color: isCurrentDay ? AppColors.white : isOnLeave? AppColors.green: null),),
          if (!isCurrentDay && iconPath.isNotEmpty) 
             AppIcons.icon(
              icon: isOnLeave? AppIcons.happy: iconPath,
              size: 12,
              color: isNightShift?AppColors.white: ShiftsMethod.getShiftColor(shift)
            ),
          
        ],
      ),
    );
  }

}