import 'package:equatable/equatable.dart';

class CalendarEntity extends Equatable{
  final int id;
  final int day;
  final String dayName;
  final String shiftId;
  final bool isOnLeave;

  const CalendarEntity({required this.id, required this.day, required this.dayName, required this.shiftId, required this.isOnLeave});
  @override
  List<Object?> get props =>[id,day,dayName,shiftId,isOnLeave];

}