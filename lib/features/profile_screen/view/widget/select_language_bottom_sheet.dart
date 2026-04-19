import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/config/style/styles.dart';
import 'package:qerp_app/core/extentions/context_helper.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/navigator/app_navigator.dart';
import 'package:qerp_app/core/network/network_service/api_base_helper.dart';
import 'package:qerp_app/core/storage/storage.dart';
import 'package:qerp_app/core/widgets/app_button.dart';
import 'package:qerp_app/features/profile_screen/view/widget/language_item.dart';

class SelectLanguageBottomSheet extends StatefulWidget {
  const SelectLanguageBottomSheet({super.key});
  
  @override
  State<SelectLanguageBottomSheet> createState() => _SelectLanguageBottomSheet();
}

class _SelectLanguageBottomSheet extends State<SelectLanguageBottomSheet>{

  late String changedLang;

  @override
  void initState() {
    super.initState();
    changedLang = sl<Storage>().getLang();
  }
   @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.r),
          topLeft: Radius.circular(10.r),
        ),
        border: BorderDirectional(
          top: BorderSide(
            width: 7.w,
            color: context.isDarkMode
                ? Theme.of(context).hintColor
                : AppColors.white,
          ),
        ),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 83,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.darkGray,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
          ),
          SizedBox(height: 20.h),
          Text(context.tr.changeLanguage, style: TextStyles.textViewMedium13),
          SizedBox(height: 10.h),
          Text(
            context.tr.restartApp,
            style: TextStyles.textViewRegular10.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
          SizedBox(height: 20.h),
          LanguageItem(
            icon: AppIcons.ksaFlag,
            title: context.arabis,
            isSelected: changedLang == 'ar',
            onTap: () {
              setState(() {
                changedLang = 'ar';
              });
            },
          ),
          SizedBox(height: 10.h),
          LanguageItem(
            icon: AppIcons.ukFlag,
            title: context.english,
            isSelected: changedLang == 'en',
            onTap: () {
              setState(() {
                changedLang = 'en';
              });
            },
          ),
          SizedBox(height: 10.h),
          AppButton(text: context.tr.save,onTap: ()async{
            await sl<Storage>().storeLang(langCode: changedLang);
            sl<ApiBaseHelper>().updateLocaleInHeaders(changedLang);
            if (!context.mounted) return;
            Phoenix.rebirth(context);
            
             sl<AppNavigator>().pop();
          },gradient: AppColors.primaryGradient,)
        ],
      ),
    );
  }

}
