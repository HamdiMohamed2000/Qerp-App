import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';

class BnbIcon extends StatelessWidget{
  final String icon;
  final String text;
  final bool isSelected;
  final Function() onTap;

  const BnbIcon({super.key, required this.icon, required this.text, required this.isSelected, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        if(isSelected)
        ShaderMask(shaderCallback: (Rect bounds){
          return AppColors.primaryGradient.createShader(bounds);
        },
        child: Column(
          spacing: 7.h,
          children: [
            AppIcons.icon(icon: icon,color: AppColors.white),
            Text(text,style: TextStyles.textViewMedium10.copyWith(color: AppColors.white),maxLines: 1,overflow: TextOverflow.ellipsis,)
          ],
        ),
        
        )
          else 
          Column(
            spacing: 7,
            children: [
              AppIcons.icon(icon: icon,color: AppColors.lightGray,),
              Text(text,style: TextStyles.textViewMedium10.copyWith(color: Theme.of(context).cardColor),maxLines: 1,overflow: TextOverflow.ellipsis,)
            ],
          )

        ],
      ),
    )
    
    );
  }

}