import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/core/widgets/circle_container.dart';

class EmptyCalendarItem extends StatelessWidget{
  final String month;
  const EmptyCalendarItem({super.key, required this.month});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 10.h,
        children: [
          CircleContainer(
            color: Theme.of(context).scaffoldBackgroundColor,
            size: 40,
            widget: AppIcons.icon(icon: AppIcons.calendar,size: 30,color: AppColors.lightGray),
          ),
          Text(context.tr.noWorkingDays,style: TextStyles.textViewBold12),
          Text('${context.tr.noWorkingDaysAddedForThisMonth}$month',style: TextStyles.textViewMedium10.copyWith(color: AppColors.lightGray)),
        ],
      ),
    );
  }

}