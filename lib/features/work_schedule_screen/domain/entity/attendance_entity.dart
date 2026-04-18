import 'package:equatable/equatable.dart';

class AttendanceEntity extends Equatable{
  final int id;
  final String date;
  final String shiftName;
  final String checkIn;
  final String checkOut;
  final bool isOnLeave;

  const AttendanceEntity({required this.id, required this.shiftName, required this.checkIn, required this.checkOut, required this.isOnLeave, required this.date});
  @override
  List<Object?> get props => [id,shiftName,checkIn,checkOut,date,isOnLeave];

} 