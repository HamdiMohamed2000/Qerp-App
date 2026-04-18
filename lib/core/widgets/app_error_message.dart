import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/extentions/localization.dart';

class AppErrorMessage extends StatelessWidget {
  final VoidCallback onRetry;
  const AppErrorMessage({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppIcons.icon(icon: AppIcons.noResult,size: 30),
        SizedBox(height: 10.h,),
        Text(context.tr.somethingWentWrong,style: TextStyles.textViewBold10.copyWith(color: AppColors.darkGray),),
        IconButton(onPressed: onRetry, icon: Icon(Icons.refresh),color:AppColors.darkGray ,)
      ],
    );
  }

}