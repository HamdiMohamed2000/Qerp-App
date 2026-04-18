import 'package:qerp_app/core/config/app_endpoints.dart';
import 'package:qerp_app/core/network/network_service/api_base_helper.dart';
import 'package:qerp_app/features/work_schedule_screen/data/model/attendance_model.dart';
import 'package:qerp_app/features/work_schedule_screen/data/model/work_schedule_calendar_model.dart';

abstract class WorkScheduleDatasource {
  Future<WorkScheduleCalendarModel> getCalender({required int month,required int year});
  Future<List<AttendanceModel>> getAttendanceList();
}

class WorkScheduleDatasourceImpl implements WorkScheduleDatasource{
  final ApiBaseHelper apiBaseHelper;

  WorkScheduleDatasourceImpl({required this.apiBaseHelper});
  @override
  Future<WorkScheduleCalendarModel> getCalender({required int month, required int year})async {
    Map<String,dynamic> queryParams = {
      'month' : month,
      'year' : year
    };
   final response = await apiBaseHelper.get(url: AppEndpoints.getAttendanceCalendar,queryParameters: queryParams);
   final result = response['data'];
   return WorkScheduleCalendarModel.fromJson(result);
  }
  
  @override
  Future<List<AttendanceModel>> getAttendanceList()async {
    final response = await apiBaseHelper.get(url: AppEndpoints.getAttendanceList);
    final result = response['data'];
    return (result as List).map((e) => AttendanceModel.fromJson(e)).toList();
  }
 
}