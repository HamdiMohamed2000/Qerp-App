import 'package:dartz/dartz.dart';
import 'package:qerp_app/core/network/network_service/failure.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/work_scedule_calendar_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/repository/work_scedule_repository.dart';

class GetCalendarUsecase {
  final WorkSceduleRepository repository;

  GetCalendarUsecase({required this.repository});

  Future<Either<Failure,WorkSceduleCalendarEntity>> call({required int month , required int year}) => repository.getCalender(month: month, year: year);
}