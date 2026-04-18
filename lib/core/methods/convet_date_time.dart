import 'package:intl/intl.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/storage/storage.dart';

class ConvertDateTime {
  static String formatDateTimeToTime(String? inputDateTime) {
    if(inputDateTime == null) return "";
    DateTime dateTime = DateTime.parse(inputDateTime);
    DateTime timezoneDateTime = convertDateTimeToDeviceTimezone(dateTime);
    return DateFormat('hh:mm a').format(timezoneDateTime);
  }

  static String formatDateTimeToDate(String? inputDateTime) {
    if(inputDateTime == null) return "";
    DateTime dateTime = DateTime.parse(inputDateTime);
    DateTime timezoneDateTime = convertDateTimeToDeviceTimezone(dateTime);
    return DateFormat('MMMM y',sl<Storage>().getLang()).format(timezoneDateTime);
  }
  
  // Function to convert UTC DateTime to local timezone
  static DateTime convertDateTimeToDeviceTimezone(DateTime dateTime) {
    if (dateTime.isUtc) {
      return dateTime.toLocal();
    }
    return dateTime;
  }


}