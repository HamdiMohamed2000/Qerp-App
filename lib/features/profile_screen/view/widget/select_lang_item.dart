import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/extentions/context_helper.dart';
import 'package:qerp_app/core/widgets/custom_popup.dart';
import 'package:qerp_app/features/profile_screen/view/widget/select_language_bottom_sheet.dart';

class SelectLangItem extends StatelessWidget {
  const SelectLangItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        CustomPopup.appShowModalBottomSheet(context: context, builder: (ctx){
          return SelectLanguageBottomSheet();
        });
      },
      child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(10.r)),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withValues(alpha: context.isDarkMode?0.05: 0.8),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.w,
              children: [
                AppIcons.icon(icon:context.isArabic? AppIcons.ksaFlag : AppIcons.ukFlag, size: 15),
                Text(
                  context.isArabic? context.arabis : context.english,
                  style: TextStyles.textViewMedium10,
                ),
                AppIcons.icon(icon: AppIcons.dropArrow,size: 18)
              ],
            ),
          ),
    );
  }
}

