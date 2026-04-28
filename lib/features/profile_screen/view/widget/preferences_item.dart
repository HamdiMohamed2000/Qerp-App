import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/core/extentions/context_helper.dart';
import 'package:qerp_app/core/widgets/app_switch.dart';
import 'package:qerp_app/features/profile_screen/view/widget/select_lang_item.dart';
import 'package:qerp_app/features/profile_screen/view/widget/settings_item.dart';

class PreferencesItem extends StatelessWidget {
  const PreferencesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingsItem(
          title: context.tr.preferences,
          icon: AppIcons.moon,
          text: context.isDarkMode? context.tr.lightMode: context.tr.darkMode,
          radius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
          ),
          widget: AppSwitch(
            value: AdaptiveTheme.of(context).brightness == Brightness.dark, 
            onChanged: (value) {value? AdaptiveTheme.of(context).setDark() : AdaptiveTheme.of(context).setLight();}
          ),
          showDivider: true,
        ),
       
        SettingsItem(
          text: context.tr.language,
          icon: AppIcons.language,
          padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10),
          radius: BorderRadius.only(
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(10.r),
          ),
          widget: SelectLangItem(),
        )
      ],
    );
  }
}
