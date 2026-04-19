import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';

class SettingsItem extends StatelessWidget{
  final Widget? widget;
  final String? text;
  final String? icon;
  final String? title;
  final BorderRadius? radius;
  final EdgeInsets? padding;
  final bool? showDivider;

  const SettingsItem({super.key, this.widget, this.text, this.icon, this.title, this.radius, this.padding, this.showDivider = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding?? EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: radius
      ),
      child: Column(
        spacing: title != null? 10.h : 0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(title != null)
          Text(title ?? '',style: TextStyles.textViewMedium10.copyWith(color: Theme.of(context).hintColor),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 7.w,
                children: [
                  ShaderMask(shaderCallback: (Rect bounds){
          return AppColors.primaryGradient.createShader(bounds);
        },child: AppIcons.icon(icon: icon!,color: AppColors.white),),
                  
                  Text(text ?? '',style: TextStyles.textViewMedium13,)
                ],
              ),

              if(widget != null) ... [
                widget!
              ] else Icon( Icons.arrow_right ,size: 30,color: Theme.of(context).hintColor,)

            ],
          ),

            if(showDivider!)
           Column(
             children: [
              SizedBox(height: 10,),
               Divider(color: Theme.of(context).hintColor.withValues(alpha: 0.4),height: 0.5,),
             ],
           ),
        ],
      ),
    );
  }

}