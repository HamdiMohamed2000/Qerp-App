import 'package:dartz/dartz.dart';
import 'package:qerp_app/core/network/network_service/failure.dart';
import 'package:qerp_app/core/network/network_service/repository_helper.dart';
import 'package:qerp_app/features/work_schedule_screen/data/datasource/work_schedule_datasource.dart';
import 'package:qerp_app/features/work_schedule_screen/data/model/attendance_model.dart';
import 'package:qerp_app/features/work_schedule_screen/data/model/work_schedule_calendar_model.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/repository/work_scedule_repository.dart';

class WorkScheduleRepositoryImpl with RepositoryHelper implements WorkSceduleRepository{
  final WorkScheduleDatasource workScheduleDatasource;

  WorkScheduleRepositoryImpl({required this.workScheduleDatasource});
  @override
  Future<Either<Failure, WorkScheduleCalendarModel>> getCalender({required int month, required int year}) async{
    return handleEither(() => workScheduleDatasource.getCalender(month: month, year: year));
  }

  @override
  Future<Either<Failure, List<AttendanceModel>>> getAttendanceList() {
    return handleEither(() => workScheduleDatasource.getAttendanceList());
  }
}