import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/widgets/app_error_message.dart';
import 'package:qerp_app/features/work_schedule_screen/view/cubit/work_schedule_cubit.dart';
import 'package:qerp_app/features/work_schedule_screen/view/cubit/work_schedule_state.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/attendance_item.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/attendance_loading_item.dart';

class AttendanceListScreen extends StatefulWidget {
  const AttendanceListScreen({super.key});

  @override
  State<AttendanceListScreen> createState() => _AttendancListScreen();
}

class _AttendancListScreen extends State<AttendanceListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WorkScheduleCubit>().getAttendanceList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkScheduleCubit, WorkScheduleState>(
      builder: (context, state) {
        if (state is GetAttendanceListLoading) {
          return AttendanceLoadingItem();
        } else if (state is GetAttendanceListSuccess) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
            itemBuilder: (context, index) {
              return AttendanceItem(
                attendanceEntity: context.read<WorkScheduleCubit>().attendanceList[index],
              );
            },
            separatorBuilder: (context, builder) => SizedBox(height: 10.h),
            itemCount: context.read<WorkScheduleCubit>().attendanceList.length,
          );
        }
        return AppErrorMessage(onRetry: context.read<WorkScheduleCubit>().getAttendanceList);
      },
      listener: (context, state) {},
    );
  }
}
