import 'package:flutter/material.dart';
import 'package:qerp_app/features/work_schedule_screen/view/screens/attendance_list_screen.dart';
import 'package:qerp_app/features/work_schedule_screen/view/screens/calendar_screen.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/schedule_toggle_bar.dart';

class WorkScheduleScreen extends StatefulWidget{
  const WorkScheduleScreen({super.key});

  @override
  State<WorkScheduleScreen> createState() => _WorkScheduleScreenState();

}

class _WorkScheduleScreenState extends State<WorkScheduleScreen>{
  
  late PageController _pageController;

  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        spacing: 10,
        children: [
          ScheduleToggleBar(index: _currentIndex, onTap: (int value) { 
            setState(() {
               _currentIndex = value;
            });
            _pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
          },),

          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index){
                setState(() {
                  _currentIndex = index;
                });
                
              },
              children: [
                AttendanceListScreen(),
                 CalendarScreen(),
              ],
            )
          )
        ],
      ),
    );
  }

}