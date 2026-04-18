import 'package:qerp_app/features/work_schedule_screen/domain/entity/shift_entity.dart';

class ShiftModel extends ShiftEntity {
  const ShiftModel({
     super.id,
     super.name,
     super.startTime,
     super.endTime,
  });

  factory ShiftModel.fromJson(Map<String, dynamic> json) {
    return ShiftModel(
      id: json['id'],
      name: json['name'],
      startTime: json['start_time'],
      endTime: json['end_time'],
    );
  }
}
