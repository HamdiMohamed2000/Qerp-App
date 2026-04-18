import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qerp_app/core/widgets/app_error_message.dart';
import 'package:qerp_app/features/work_schedule_screen/view/cubit/work_schedule_cubit.dart';
import 'package:qerp_app/features/work_schedule_screen/view/cubit/work_schedule_state.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/custom_calendar_table.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/loading_calendar_item.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WorkScheduleCubit>().getCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkScheduleCubit, WorkScheduleState>(
      builder: (context, state) {
        if (state is GetCalendarSuccess) {
          return CustomCalendarTable(
            calendarData: state.calendarData.calendar!,
            focusedDay: DateTime(state.year, state.month),
            shiftEntity: state.calendarData.shifts!,
            onForword: () => context.read<WorkScheduleCubit>().nextMonth(),
            onBack: () => context.read<WorkScheduleCubit>().previousMonth(),
          );
        } else if(state is GetCalendarLoading){
          return LoadingCalendarItem();
        }
        return AppErrorMessage(onRetry: () => context.read<WorkScheduleCubit>().getCalendar(),);
        
      },
      listener: (context, state) {},
    );
  }
}
