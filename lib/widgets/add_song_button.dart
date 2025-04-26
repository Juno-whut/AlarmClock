import 'package:alarm_clock/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/services/music_service.dart';

class AddSongButton extends StatefulWidget {
  const AddSongButton({super.key});

  @override
  State<AddSongButton> createState() => _AddSongButtonState();
}

class _AddSongButtonState extends State<AddSongButton> {
  @override
  void initState() {
    super.initState();
  }

  void refreshPage() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {
        importSong();
        refreshPage();
        },
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