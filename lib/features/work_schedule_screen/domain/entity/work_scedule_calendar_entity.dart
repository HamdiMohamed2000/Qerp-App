import 'package:equatable/equatable.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/calendar_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/shift_entity.dart';

class WorkSceduleCalendarEntity extends Equatable{
final List<ShiftEntity>? shifts;
final List<CalendarEntity>? calendar;

  const WorkSceduleCalendarEntity({this.shifts,this.calendar});

  @override
  List<Object?> get props => [shifts,calendar];


}