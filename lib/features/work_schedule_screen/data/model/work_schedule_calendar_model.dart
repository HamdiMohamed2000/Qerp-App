import 'package:qerp_app/features/work_schedule_screen/data/model/calendar_model.dart';
import 'package:qerp_app/features/work_schedule_screen/data/model/shift_model.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/work_scedule_calendar_entity.dart';

class WorkScheduleCalendarModel extends WorkSceduleCalendarEntity {
  const WorkScheduleCalendarModel({super.shifts, super.calendar});

  factory WorkScheduleCalendarModel.fromJson(Map<String, dynamic> json) {
    return WorkScheduleCalendarModel(
      shifts: (json['shifts'] as List)
          .map((e) => ShiftModel.fromJson(e))
          .toList(),
      calendar: (json['calendar'] as List)
          .map((e) => CalendarModel.fromJson(e))
          .toList(),
    );
  }
}
