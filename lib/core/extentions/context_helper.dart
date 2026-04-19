import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/storage/storage.dart';

extension ContextHelpers on BuildContext {
  bool get isDarkMode => AdaptiveTheme.of(this).brightness == Brightness.dark;
  bool get isArabic => sl<Storage>().getLang() == 'ar';
  String get arabis => 'العربية';
  String get english => 'English';
} 