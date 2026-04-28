import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qerp_app/features/work_schedule_screen/domain/entity/shift_entity.dart';
import 'package:qerp_app/features/work_schedule_screen/view/widgets/shift_item.dart';

class ShiftsGridList extends StatelessWidget{
  final List<ShiftEntity> shiftEntity;

  const ShiftsGridList({super.key, required this.shiftEntity});
  @override
  Widget build(BuildContext context) {
    final filteredShifts = shiftEntity.where((shift) => shift.id != 5).toList();
   return GridView.builder(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,        
        mainAxisSpacing: 8.h,     
        crossAxisSpacing: 10.w,     
        childAspectRatio: 3.5,      
      ),
    itemBuilder: (context,index){
      return ShiftItem(shiftEntity: filteredShifts,index: index,);
   },
   shrinkWrap: true,
   itemCount: filteredShifts.length,);
  }

}