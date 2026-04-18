import 'package:dartz/dartz.dart';
import 'package:qerp_app/core/network/network_service/failure.dart';
import 'package:qerp_app/features/work_schedule_screen/data/model/attendance_model.dart';
import 'package:qerp_app/features/work_schedule_screen/data/model/work_schedule_calendar_model.dart';

abstract class WorkSceduleRepository {
  Future<Either<Failure,WorkScheduleCalendarModel>> getCalender({required int month , required int year});
  Future<Either<Failure,List<AttendanceModel>>> getAttendanceList();
}