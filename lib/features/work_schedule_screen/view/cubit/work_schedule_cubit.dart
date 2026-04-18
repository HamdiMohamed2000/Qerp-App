import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/attendance_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/usecases/get_attendance_list_usecas.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/usecases/get_calendar_usecase.dart';
import 'package:qerp_app/features/work_schedule_screen/view/cubit/work_schedule_state.dart';

class WorkScheduleCubit extends Cubit<WorkScheduleState> {
  final GetCalendarUsecase getCalendarUsecase;
  final GetAttendanceListUsecase getAttendanceListUsecase;
  WorkScheduleCubit({
    required this.getCalendarUsecase,
    required this.getAttendanceListUsecase,
  }) : super(WorkSceduleInitialState());

  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;
  
  List<AttendanceEntity> attendanceList = [];

  Future<void> getCalendar() async {
    emit(GetCalendarLoading());
    final result = await getCalendarUsecase(
      month: currentMonth,
      year: currentYear,
    );
    if (!isClosed) {
      result.fold(
        (failure) => emit(GetCalendarError(message: failure.message)),
        (success) => emit(
          GetCalendarSuccess(
            calendarData: success,
            month: currentMonth,
            year: currentYear,
          ),
        ),
      );
    }
  }

  void nextMonth() {
    if (currentMonth == 12) {
      currentMonth = 1;
      currentYear++;
    } else {
      currentMonth++;
    }
    getCalendar();
  }

  void previousMonth() {
    if (currentMonth == 1) {
      currentMonth = 12;
      currentYear--;
    } else {
      currentMonth--;
    }
    getCalendar();
  }

  Future<void> getAttendanceList() async {
    emit(GetAttendanceListLoading());
    final result = await getAttendanceListUsecase();
    if (!isClosed) {
      result.fold(
        (failure) => emit(GetAttendanceListError(message: failure.message)),
        (success) {
            attendanceList.clear();
            attendanceList = success;
            emit(GetAttendanceListSuccess(attendanceList: success));
        });
    }
  }
}
