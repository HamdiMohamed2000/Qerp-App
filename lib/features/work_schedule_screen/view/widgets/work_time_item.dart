import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';

class WorkTimeItem extends StatelessWidget{
  final String workHour;
  final String workingTime;
  final bool isStartingTime;
  const WorkTimeItem({super.key, required this.workHour, required this.workingTime,this.isStartingTime = false});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 5.h,
            children: [
              AppIcons.icon(icon: AppIcons.clock,color: isStartingTime?AppColors.green : AppColors.red,size: 18),
              Text(workHour,style: TextStyles.textViewBold16,),
              Text(workingTime,style: TextStyles.textViewRegular8.copyWith(color: Theme.of(context).hintColor),),
            ],
          );
  }

}