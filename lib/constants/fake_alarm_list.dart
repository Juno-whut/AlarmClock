class AlarmList {
  final String time;
  final String song;
  final String ampm;
  final String? title;
  late bool isOn = true;

  AlarmList({
    required this.time,
    required this.song,
    required this.isOn,
    required this.ampm,
    this.title
  });
}


List<AlarmList> alarms = [
  // example project 1
  AlarmList(
    time: "5:20",
    song: "placeholder",
    isOn: true,
    ampm: "PM",
    title: "Alarm 1",
  ),
  // example project 2
  AlarmList(
    time: "5:30",
    song: "placeholder",
    isOn: true,
    ampm: "PM",
  ),
];