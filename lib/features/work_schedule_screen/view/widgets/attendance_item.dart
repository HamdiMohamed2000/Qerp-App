import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/core/methods/shifts_method.dart';
import 'package:qerp_app/core/widgets/app_chip.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/attendance_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/work_time_item.dart';

class AttendanceItem extends StatelessWidget {
  final AttendanceEntity attendanceEntity;
  const AttendanceItem({super.key, required this.attendanceEntity});

  @override
  Widget build(BuildContext context) {
    final isOnLeave = attendanceEntity.isOnLeave;
    final shift = ShiftsMethod.getShift(
      ShiftsMethod.getShiftValue(
        ShiftsMethod.shiftNameMapping[isOnLeave
            ? true
            : attendanceEntity.shiftName]!,
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        color: Theme.of(context).cardColor,
        border: BorderDirectional(
          start: BorderSide(color: ShiftsMethod.getShiftColor(shift), width: 7),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 5.w,
                children: [
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipOval(
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: isOnLeave ? 40 : 0,
                              sigmaY: isOnLeave ? 40 : 0,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isOnLeave
                                    ? null
                                    : ShiftsMethod.getShiftColor(
                                        shift,
                                      ).withValues(alpha: 0.2),
                                gradient: isOnLeave
                                    ? AppColors.primaryGradient
                                    : null,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).colorScheme.outline.withValues(alpha: 0.1),
                            ),
                          ),
                        ),
                        if (isOnLeave) ...[
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return AppColors.primaryGradient.createShader(
                                bounds,
                              );
                            },
                            child: AppIcons.icon(
                              icon: AppIcons.calendar,
                              color: AppColors.white,
                              size: 20,
                            ),
                          ),
                        ] else
                          AppIcons.icon(
                            icon: AppIcons.calendar,
                            color: ShiftsMethod.getShiftColor(shift),
                            size: 20,
                          ),
                      ],
                    ),
                  ),

                  Text(
                    attendanceEntity.date,
                    style: TextStyles.textViewRegular10.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
              AppChip(
                color: ShiftsMethod.getShiftColor(shift).withValues(alpha: 0.1),
                child: Row(
                  spacing: 5.w,
                  children: [
                    AppIcons.icon(
                      icon: isOnLeave
                          ? AppIcons.happy
                          : ShiftsMethod.getShiftIcon(shift),
                      color: isOnLeave
                          ? AppColors.green
                          : ShiftsMethod.getShiftColor(shift),
                    ),
                    Text(
                      isOnLeave
                          ? context.tr.dayOff
                          : attendanceEntity.shiftName,
                      style: TextStyles.textViewMedium8.copyWith(
                        color: isOnLeave
                            ? AppColors.green
                            : ShiftsMethod.getShiftColor(shift),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          isOnLeave
              ? Column(
                  spacing: 5.h,
                  children: [
                    Text(
                      context.tr.noWorkToday,
                      style: TextStyles.textViewMedium12,
                    ),
                    Text(
                      context.tr.enjoyYourDay,
                      style: TextStyles.textViewRegular10.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WorkTimeItem(
                      workHour: attendanceEntity.checkIn,
                      workingTime: context.tr.startOfWork,
                      isStartingTime: true,
                    ),
                    WorkTimeItem(
                      workHour: attendanceEntity.checkOut,
                      workingTime: context.tr.endOfWork,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
