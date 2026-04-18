import 'package:flutter/widgets.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/enum/shifts_enum.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/navigator/app_navigator.dart';

class ShiftsMethod {
  static final BuildContext _context = sl<AppNavigator>().navigatorKey.currentContext!;
  static ShiftsEnum getShift(String shiftId){
    return switch(shiftId){
      '1' => ShiftsEnum.night,
      '2' => ShiftsEnum.morning,
      '3' => ShiftsEnum.day,
      '4' => ShiftsEnum.fullTime,
      '5' => ShiftsEnum.evening,
      _ => ShiftsEnum.dayOff
    };
  }

  static String getShiftValue(ShiftsEnum shift){
    return switch(shift){
      ShiftsEnum.night => '1',
      ShiftsEnum.morning => '2',
      ShiftsEnum.day => '3',
      ShiftsEnum.fullTime => '4',
      ShiftsEnum.evening => '5',
      ShiftsEnum.dayOff => '0',
      
    };
  }

  static const Map<dynamic, ShiftsEnum> shiftNameMapping = {
    'دوام كامل': ShiftsEnum.fullTime,
    'دوام صباحي': ShiftsEnum.morning,
    'دوام ليلي': ShiftsEnum.night,
    'دوام نهاري': ShiftsEnum.day,
    true : ShiftsEnum.dayOff,

    'Full Day': ShiftsEnum.fullTime,
    'Morning Shift': ShiftsEnum.morning,
    'Night Shift': ShiftsEnum.night,
    'Day Shift': ShiftsEnum.day,
  };

  static String getShiftText(ShiftsEnum shift){
    return switch(shift){
      ShiftsEnum.night => _context.tr.nightShift,
      ShiftsEnum.morning => _context.tr.morningShift,
      ShiftsEnum.day => _context.tr.dayShift,
      ShiftsEnum.fullTime => _context.tr.fullShift,
      ShiftsEnum.evening => _context.tr.eveningShif,
      ShiftsEnum.dayOff => _context.tr.dayOff,
    };
  }

  static Color getShiftColor(ShiftsEnum shift){
    return switch(shift){
      ShiftsEnum.night => AppColors.darkGray,
      ShiftsEnum.morning => AppColors.morningYello,
      ShiftsEnum.day => AppColors.noonOrange,
      ShiftsEnum.evening => AppColors.eveningBlue,
      ShiftsEnum.dayOff => AppColors.green,
      _=> AppColors.darkGray
    };
  } 

  static String getShiftIcon(ShiftsEnum shift){
    return switch(shift){
      ShiftsEnum.night => AppIcons.moon,
      ShiftsEnum.morning => AppIcons.sunrise,
      ShiftsEnum.day => AppIcons.sun,
      ShiftsEnum.evening => AppIcons.sunset,
      ShiftsEnum.dayOff => AppIcons.happy,
      _ => AppIcons.moon
    };
  }
}