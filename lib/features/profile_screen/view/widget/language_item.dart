import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/features/profile_screen/view/widget/custom_radio_circle.dart';

class LanguageItem extends StatelessWidget{
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;
  const LanguageItem({super.key, required this.icon, required this.title, required this.isSelected, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 20.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2))
        ),
        child: Row(
          spacing: 10.w,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomRadioCircle(isSelected: isSelected),
            AppIcons.icon(icon: icon,size: 15),
            Text(title,style: TextStyles.textViewMedium14,)
          ],
        ),
      ),
    );
  }


  
}

