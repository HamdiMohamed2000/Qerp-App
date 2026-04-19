import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  AppIcons._();

  static const String _path = 'assets/icons/';

  static const String home = '${_path}home.svg';
  static const String clock = '${_path}clock.svg';
  static const String info = '${_path}info.svg';
  static const String profile = '${_path}profile.svg';

  static const String calendar = '${_path}calendar.svg';
  static const String document = '${_path}document.svg';
  static const String happy = '${_path}happy.svg';
  static const String help = '${_path}help.svg';
  static const String list = '${_path}list.svg';
  static const String lock = '${_path}lock.svg';
  static const String moon = '${_path}moon.svg';
  static const String sun = '${_path}sun.svg';
  static const String sunrise = '${_path}sunrise.svg';
  static const String sunset = '${_path}sunset.svg';
  static const String ticket = '${_path}ticket.svg';
  static const String leftArrow = '${_path}left_arrow.svg';
  static const String rightArrow = '${_path}right_arrow.svg';
  static const String noResult = '${_path}no_results.svg';
  static const String language = '${_path}language.svg';
  static const String ukFlag = '${_path}uk.svg';
  static const String ksaFlag = '${_path}ksa.svg';
  static const String dropArrow = '${_path}drop_arrow.svg';

  static Widget icon({required String icon, double size = 24, Color? color}) =>
      SvgPicture.asset(
        icon,
        width: size,
        height: size,
        colorFilter: color == null
            ? null
            : ColorFilter.mode(color, BlendMode.srcIn),
      );
}
