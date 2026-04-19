import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/features/profile_screen/view/widget/general_setting_item.dart';
import 'package:qerp_app/features/profile_screen/view/widget/preferences_item.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          spacing: 20.h,
          children: [
            PreferencesItem(),
            GeneralSettingItem()
          ],
        ),
      ),
    );
  }

}