import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/core/extentions/theme_mode.dart';
import 'package:qerp_app/core/widgets/app_button.dart';

class ScheduleToggleBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;
  const ScheduleToggleBar({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
      child: Row(
        spacing: 10.w,
        children: [
          Expanded(
            child: AppButton(
              gradient: index == 0 ? AppColors.primaryGradient : null,
              color: index != 0 ? Theme.of(context).cardColor : null,
              borderColor: index != 0 ? Theme.of(context).colorScheme.outline.withValues(alpha:context.isDarkMode? 0.05:1.0) : null,
              onTap: () => onTap(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.w,
                children: [
                  AppIcons.icon(icon: AppIcons.list, size: 13,color: index == 0? AppColors.white:AppColors.lightGray),
                  Text(context.tr.list, style: TextStyles.textViewMedium10.copyWith(color: index == 0? AppColors.white:AppColors.lightGray)),
                ],
              ),
            ),
          ),

          Expanded(
            child: AppButton(
              gradient: index == 1 ? AppColors.primaryGradient : null,
              color: index != 1 ? Theme.of(context).cardColor : null,
              borderColor: index != 1 ? Theme.of(context).colorScheme.outline.withValues(alpha:context.isDarkMode? 0.05:1.0): null,
              onTap: () => onTap(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10.w,
                children: [
                  AppIcons.icon(icon: AppIcons.calendar, size: 18,color: index == 1 ?AppColors.white:AppColors.lightGray),
                  Text(context.tr.calendar, style: TextStyles.textViewMedium10.copyWith(color: index == 1 ?AppColors.white:AppColors.lightGray)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
