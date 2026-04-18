import 'package:equatable/equatable.dart';

class ShiftEntity extends Equatable{
  final int? id;
  final String? name;
  final String? startTime;
  final String? endTime;

  const ShiftEntity({ this.id,this.name, this.startTime, this.endTime});
  @override
  List<Object?> get props => [id,name,startTime,endTime];

}