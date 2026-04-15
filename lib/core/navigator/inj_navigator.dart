import 'package:get_it/get_it.dart';
import 'package:qerp_app/core/navigator/app_navigator.dart';

void initNavigator(GetIt sl){
sl.registerLazySingleton<AppNavigator>(() => AppNavigator());
}