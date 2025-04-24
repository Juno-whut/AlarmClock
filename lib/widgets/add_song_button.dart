import 'package:alarm_clock/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/services/add_song_service.dart';

class AddSongButton extends StatelessWidget {
  const AddSongButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {pickMp3File();},
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