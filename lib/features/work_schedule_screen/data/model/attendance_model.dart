import 'package:qerp_app/features/work_schedule_screen/domain/entity/attendance_entity.dart';

class AttendanceModel extends AttendanceEntity {
  const AttendanceModel({
    required super.id,
    required super.date,
    required super.shiftName,
    required super.checkIn,
    required super.checkOut,
    required super.isOnLeave,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'],
      date: json['date'],
      shiftName: json['shift_name'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      isOnLeave: json['is_on_leave'],
    );
  }
}
