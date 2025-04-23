import 'package:alarm_clock/constants/colors.dart';
import 'package:flutter/material.dart';

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {},
      backgroundColor: AppColors.primary,
      child: const Icon(
        Icons.add, 
        color: 
        AppColors.onPrimary, 
        size: 36,
      ),
    );
  }
}