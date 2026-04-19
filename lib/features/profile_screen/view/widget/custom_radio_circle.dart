import 'package:flutter/material.dart';
import 'package:qerp_app/core/config/app_colors.dart';
import 'package:qerp_app/core/widgets/circle_container.dart';

class CustomRadioCircle extends StatelessWidget {
  final bool isSelected;
  const CustomRadioCircle({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      size: 20, 
      gradient: isSelected ? AppColors.primaryGradient : null,
      color: isSelected ? null : Theme.of(context).colorScheme.outline,
      widget: Center(
        child: CircleContainer(
          size: 17,

          color: Theme.of(context).colorScheme.secondary, 
          widget: isSelected 
              ? Center(
                  child: CircleContainer(
                    size: 10, 
                    gradient: AppColors.primaryGradient,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}