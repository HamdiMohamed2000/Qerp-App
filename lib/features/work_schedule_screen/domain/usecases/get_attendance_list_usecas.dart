import 'package:dartz/dartz.dart';
import 'package:qerp_app/core/network/network_service/failure.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/attendance_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/repository/work_scedule_repository.dart';

class GetAttendanceListUsecase {
  final WorkSceduleRepository repository;

 const GetAttendanceListUsecase({required this.repository});

 Future<Either<Failure,List<AttendanceEntity>>> call() => repository.getAttendanceList();
}