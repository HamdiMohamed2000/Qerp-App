import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/config/app_icons.dart';
import 'package:qerp_app/core/extentions/localization.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/core/widgets/circle_container.dart';
import 'package:qerp_app/features/layout_screen/view/cubit/bnb_cubit.dart';
import 'package:qerp_app/features/layout_screen/view/cubit/bnb_state.dart';
import 'package:qerp_app/features/layout_screen/view/widgets/bnb_icon.dart';
import 'package:qerp_app/features/profile_screen/view/screen/profile_screen.dart';
import 'package:qerp_app/features/work_schedule_screen/view/cubit/work_schedule_cubit.dart';
import 'package:qerp_app/features/work_schedule_screen/view/screens/work_schedule_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      Container(),
      BlocProvider(
        create: (context) => sl<WorkScheduleCubit>(),
        child: WorkScheduleScreen(),
      ),
      Container(),
      ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BnbCubit, BnbState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          floatingActionButton: Transform.translate(
  offset: Offset(0, 15.h), 
  child: CircleContainer(
    size: 70,
    color: Theme.of(context).cardColor,
    widget: Center(
      child: CircleContainer(
        size: 45,
        shadow: [
          BoxShadow(
      color: AppColors.blue.withValues(alpha: 0.5),
      blurRadius: 12,
      spreadRadius: 0,
      offset: const Offset(0, 4),
    ),
        ],
        gradient: AppColors.primaryGradient,
        widget: Center(child: AppIcons.icon(icon: AppIcons.ticket, color: AppColors.white)),
      ),
    ),
  )
),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: screens[state.bnbIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(15.r),
              topRight: Radius.circular(15.r),
            ),
            child: BottomAppBar(
              color: Theme.of(context).cardColor,
              child: Row(
                spacing: 40,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        BnbIcon(
                          icon: AppIcons.home,
                          text: context.tr.home,
                          isSelected: state.bnbIndex == 0,
                          onTap: () {
                            if (state.bnbIndex != 0) {
                              context.read<BnbCubit>().changeIndex(currentIndex: 0);
                            }
                          },
                        ),
                        BnbIcon(
                      icon: AppIcons.clock,
                      text: context.tr.workSchedule,
                      isSelected: state.bnbIndex == 1,
                      onTap: () {
                        if (state.bnbIndex != 1) {
                          context.read<BnbCubit>().changeIndex(currentIndex: 1);
                        }
                      },
                    ),
                      ],
                    ),
                  ),
                  
              
                  Expanded(
                    child: Row(
                      children: [
                        BnbIcon(
                          icon: AppIcons.info,
                          text: context.tr.information,
                          isSelected: state.bnbIndex == 2,
                          onTap: () {
                            if (state.bnbIndex != 2) {
                              context.read<BnbCubit>().changeIndex(currentIndex: 2);
                            }
                          },
                        ),
                        BnbIcon(
                      icon: AppIcons.profile,
                      text: context.tr.profile,
                      isSelected: state.bnbIndex == 3,
                      onTap: () {
                        if (state.bnbIndex != 3) {
                          context.read<BnbCubit>().changeIndex(currentIndex: 3);
                        }
                      },
                    ),
                      ],
                    ),
                  ),
              
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
