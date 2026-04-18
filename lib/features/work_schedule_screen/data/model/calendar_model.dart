import 'package:qerp_app/features/work_schedule_screen/domain/entity/calendar_entity.dart';

class CalendarModel extends CalendarEntity {
  const CalendarModel({
    required super.id,
    required super.day,
    required super.dayName,
    required super.shiftId,
    required super.isOnLeave,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      id: json['id'],
      day: json['day'],
      dayName: json['day_name'],
      shiftId: json['shift_id'],
      isOnLeave: json['is_on_leave'],
    );
  }
}
