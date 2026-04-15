import 'package:qerp_app/core/config/env_keys.dart';
import 'package:qerp_app/core/extentions/env.dart';

class AppEndpoints {
  static String baseUrl = EnvKeys.baseUrl.env;
  static String getAttendanceCalendar = EnvKeys.getAttendanceCalendar.env;
  static String getAttendanceList = EnvKeys.getAttendanceList.env;

  static String language = EnvKeys.language.env;
}