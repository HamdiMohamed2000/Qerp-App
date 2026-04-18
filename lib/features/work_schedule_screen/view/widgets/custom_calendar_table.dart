import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/methods/convet_date_time.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/shift_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/calendar_header.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/calendar_table.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/empty_calendar_item.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/shifts_grid_list.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/calendar_entity.dart';

class CustomCalendarTable extends StatelessWidget {
  final List<CalendarEntity> calendarData;
  final DateTime focusedDay;
  final List<ShiftEntity> shiftEntity;
  final Function() onForword;
  final Function() onBack;
  const CustomCalendarTable({
    super.key,
    required this.calendarData,
    required this.focusedDay,
    required this.shiftEntity,
    required this.onForword,
    required this.onBack,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15.h),
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 20.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          spacing: 15.h,
          children: [
            CalendarHeader(
              date: focusedDay,
              onForwordClicked: onForword,
              onBackClicked: onBack,
            ),

            if (calendarData.isNotEmpty) ...[
              CalendarTable(calendarData: calendarData, focusedDay: focusedDay,)
            ] else
              Center(
                child: EmptyCalendarItem(
                  month: ConvertDateTime.formatDateTimeToDate(
                    focusedDay.toString(),
                  ),
                ),
              ),
            if (calendarData.isNotEmpty)
              ShiftsGridList(shiftEntity: shiftEntity),
          ],
        ),
      ),
    );
  }
}
