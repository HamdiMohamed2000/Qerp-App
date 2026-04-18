import 'package:get_it/get_it.dart';
import 'package:qerp_app/features/work_schedule_screen/data/datasource/work_schedule_datasource.dart';
import 'package:qerp_app/features/work_schedule_screen/data/repository/work_schedule_repository_impl.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/repository/work_scedule_repository.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/usecases/get_attendance_list_usecas.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/usecases/get_calendar_usecase.dart';
import 'package:qerp_app/features/work_schedule_screen/view/cubit/work_schedule_cubit.dart';

Future<void> workSchduleInj(GetIt sl)async {
// Datasource
sl.registerLazySingleton<WorkScheduleDatasource>(() => WorkScheduleDatasourceImpl(apiBaseHelper: sl()));

// Repository
sl.registerLazySingleton<WorkSceduleRepository>(() => WorkScheduleRepositoryImpl(workScheduleDatasource: sl()));

// usecase
sl.registerLazySingleton<GetCalendarUsecase>(() => GetCalendarUsecase(repository: sl()));
sl.registerLazySingleton<GetAttendanceListUsecase>(() => GetAttendanceListUsecase(repository: sl()));

//cubit
sl.registerFactory<WorkScheduleCubit>(() => WorkScheduleCubit(getCalendarUsecase: sl(),getAttendanceListUsecase: sl()));

}