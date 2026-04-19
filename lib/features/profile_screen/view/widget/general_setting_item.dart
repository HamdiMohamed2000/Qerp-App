import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/features/profile_screen/view/widget/settings_item.dart';

class GeneralSettingItem extends StatelessWidget{
  const GeneralSettingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsItem(
          padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10),
          title: context.tr.generalSettings,
          icon: AppIcons.document,
          text: context.tr.termsOfUse,
          radius: BorderRadius.only(topRight: Radius.circular(10.r),topLeft: Radius.circular(10.r)),
        ),
        SettingsItem(
          padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10),
          icon: AppIcons.lock,
          text: context.tr.privacyPolicy,
        ),
        SettingsItem(
          padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10),
          icon: AppIcons.help,
          text: context.tr.helpCenter,
          radius: BorderRadius.only(bottomLeft: Radius.circular(10.r),bottomRight: Radius.circular(10.r)),
        )
      ],
    );
  }

}