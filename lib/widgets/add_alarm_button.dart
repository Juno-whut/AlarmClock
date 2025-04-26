import 'package:alarm_clock/constants/colors.dart';
import 'package:alarm_clock/services/music_service.dart';
import 'package:flutter/material.dart';
import 'package:alarm_clock/constants/alarm_class.dart';
import 'package:alarm_clock/constants/song_class.dart';
import 'package:alarm_clock/services/alarm_service.dart';

class AddAlarmButton extends StatefulWidget {
  const AddAlarmButton({super.key});

  @override
  State<AddAlarmButton> createState() => _AddAlarmButtonState();
}

class _AddAlarmButtonState extends State<AddAlarmButton> {
  List<SongLibrary> songList = [];

  @override
  void initState() {
    super.initState();
    loadSongs().then((songs) {
      setState(() {
        songList = songs;
      });
    });
  }

  void refreshPage() {
    setState(() {});
  }
  
  void _showAddAlarmDialog(List<SongLibrary> songList) async {
  String? selectedTitle;
  TimeOfDay? selectedTime;
  SongLibrary? selectedSong;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add New Alarm'),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Alarm Name Input
                TextField(
                  decoration: InputDecoration(labelText: "Alarm Name"),
                  onChanged: (value) {
                    selectedTitle = value;
                  }
                ),
                SizedBox(height:10),

                // Time Picker
                ElevatedButton(
                  onPressed: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now()
                    );
                    if (time != null) {
                      setState((){
                        selectedTime = time;
                      });
                    }
                  },  
                  child: Text(
                    selectedTime == null 
                    ? "Pick Time"
                    : '${selectedTime!.hourOfPeriod}:${selectedTime!.minute.toString().padLeft(2, '0')} ${selectedTime!.period == DayPeriod.am ? 'AM':'PM'}'
                  ),
                ),
                SizedBox(height: 10),

                // Song DropDown
                DropdownButton<SongLibrary>(
                  hint: Text('Select Song'),
                  isExpanded: true,
                  value: selectedSong,
                  onChanged: (song) {
                    setState((){
                      selectedSong = song;
                    });
                  },
                  items: songList.map((song) {
                    return DropdownMenuItem<SongLibrary>(
                      value: song,
                      child: Text(song.name),
                    );
                  }).toList(),
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (selectedTime != null && selectedSong != null) {
                final hour = selectedTime!.hourOfPeriod;
                final minute = selectedTime!.minute;
                final ampm = selectedTime!.period == DayPeriod.am ? 'AM' : 'PM';
                final timeFormatted =
                    '${hour == 0 ? 12 : hour}:${minute.toString().padLeft(2, '0')}';
                
                final newAlarm = AlarmList(
                  time: timeFormatted,
                  ampm: ampm,
                  song: selectedSong!.name,
                  songPath: selectedSong!.path,
                  isOn: true,
                  title: selectedTitle ?? 'Alarm'
                );

                final existingAlarms = await readAlarmJsonList();
                existingAlarms.add(newAlarm);
                await writeAlarmJsonList(
                  existingAlarms.map((e) => e.toJson()).toList()
                );
                
                Navigator.of(context).pop();
                setState(() {});
              }
              refreshPage();
            }, 
            child: Text('Add Alarm')
            
          ),
        ],
      );
    }
  );
}
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () => _showAddAlarmDialog(songList),
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