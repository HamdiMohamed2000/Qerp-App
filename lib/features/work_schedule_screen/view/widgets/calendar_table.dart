import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/extentions/context_helper.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/storage/storage.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/calendar_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/calendar_day_item.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatelessWidget {
  final List<CalendarEntity> calendarData;
  final DateTime focusedDay;
  const CalendarTable({super.key, required this.calendarData, required this.focusedDay});



 CalendarEntity _fetchDays(DateTime day) {
    return calendarData.cast<CalendarEntity>().firstWhere(
      (element) => element.day == day.day && day.month == focusedDay.month,
      orElse: () => CalendarEntity(
        id: 0,
        day: day.day,
        dayName: DateFormat.E().format(day),
        shiftId: '',
        isOnLeave: false,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      child: TableCalendar(
                  locale: sl<Storage>().getLang(),
                  availableGestures: AvailableGestures.none,
                  firstDay: DateTime.utc(
                    DateTime.now().year,
                    DateTime.now().month,
                  ),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: focusedDay,
                  headerVisible: false,
                  daysOfWeekHeight: 42.h,
                  rowHeight: 60.h,
                  calendarStyle: CalendarStyle(outsideDaysVisible: true),
      
                  calendarBuilders: CalendarBuilders(
                    dowBuilder: (context, day) {
                      final dayName = DateFormat.E(
                        sl<Storage>().getLang(),
                      ).format(day);
      
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 3.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline
                                .withValues(
                                  alpha: context.isDarkMode ? 0.05 : 1.0,
                                ),
                            width: 0.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.05),
                              blurRadius: 24,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(dayName, style: TextStyles.textViewMedium9),
                        ),
                      );
                    },
      
                    todayBuilder: (context, day, focusedDay) {
                      final entity = _fetchDays(day);
                      return CalendarDayItem(
                        calendarEntity: entity,
                        isCurrentDay: true,
                      );
                    },
                    defaultBuilder: (context, day, focusedDay) {
                      final entity = _fetchDays(day);
                      return  CalendarDayItem(calendarEntity: entity);
                    },
      
                    outsideBuilder: (context, day, focusedDay) {
                      return Container(
                        width: 43.w,
                        height: 52.h,
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Theme.of(context).colorScheme.secondary,
                          border: Border.all(
                            color: Theme.of(context).colorScheme.outline
                                .withValues(
                                  alpha: context.isDarkMode ? 0.05 : 1.0,
                                ),
                            width: 0.5,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyles.textViewBold14.copyWith(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }

}