import 'package:equatable/equatable.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/attendance_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/work_scedule_calendar_entity.dart';

class WorkScheduleState extends Equatable{
  const WorkScheduleState();
  @override
  List<Object?> get props => [];
}
final class WorkSceduleInitialState extends WorkScheduleState{}
final class GetCalendarLoading extends WorkScheduleState{}
final class GetCalendarSuccess extends WorkScheduleState{
  final WorkSceduleCalendarEntity calendarData;
  final int month;
  final int year;
  const GetCalendarSuccess({required this.calendarData,required this.month,required this.year});
  @override
  List<Object?> get props => [calendarData];
}
final class GetCalendarError extends WorkScheduleState{
  final String message;
  const GetCalendarError({required this.message});
  @override
  List<Object?> get props => [message];
} 


final class GetAttendanceListLoading extends WorkScheduleState{}
final class GetAttendanceListSuccess extends WorkScheduleState{
  final List<AttendanceEntity> attendanceList;

  const GetAttendanceListSuccess({required this.attendanceList});
  @override
  List<Object?> get props => [attendanceList];
}

final class GetAttendanceListError extends WorkScheduleState{
  final String message;

   const GetAttendanceListError({required this.message});
  @override
  List<Object?> get props => [message];
}