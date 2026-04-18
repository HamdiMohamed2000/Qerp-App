import 'package:flutter/material.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/methods/convet_date_time.dart';
import 'package:qerp_app/core/storage/storage.dart';

class CalendarHeader extends StatelessWidget{
    final DateTime date;
    final Function() onForwordClicked;
    final Function() onBackClicked;
  const CalendarHeader({super.key, required this.date, required this.onForwordClicked, required this.onBackClicked});

  @override
  Widget build(BuildContext context) {
    final bool isArabic = sl<Storage>().getLang() == 'ar';
    final bool isCurrentMonth =
        date.year == DateTime.now().year && date.month == DateTime.now().month;
    final backIcon = isArabic ? AppIcons.rightArrow : AppIcons.leftArrow;
    final forwardIcon = isArabic ? AppIcons.leftArrow : AppIcons.rightArrow;
    
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: isCurrentMonth ? null : onBackClicked,
          child: AppIcons.icon(
            icon: backIcon,
            color: isCurrentMonth
                ? AppColors.lightGray
                : Theme.of(context).colorScheme.onSurface,
          ),
        ),

        Text(
          ConvertDateTime.formatDateTimeToDate(date.toString()),
          style: TextStyles.textViewMedium14,
        ),

        InkWell(
          onTap: onForwordClicked,
          child: AppIcons.icon(
            icon: forwardIcon,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

}