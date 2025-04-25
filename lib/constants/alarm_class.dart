class AlarmList {
  final String time;
  final String song;
  final String songPath;
  final String ampm;
  final String? title;
  late bool isOn = true;

  AlarmList({
    required this.time,
    required this.song, 
    required this.songPath,
    required this.isOn,
    required this.ampm,
    this.title
  });

  factory AlarmList.fromJson(Map<String, dynamic> json) {
    return AlarmList(
      time: json['time'],
      song: json['song'],
      songPath: json['songPath'],
      isOn: json['isOn'],
      ampm: json['ampm'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'song': song,
      'songPath': songPath,
      'isOn': isOn,
      'ampm': ampm,
      'title': title
    };
  }
}

