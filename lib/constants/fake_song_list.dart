class SongLibrary {
  final String length;
  final String name;
  final String path;

  SongLibrary({
    required this.length,
    required this.name,
    required this.path,
  });
}


List<SongLibrary> songList = [
  // example project 1
  SongLibrary(
    name: "Stronger",
    length: "3:30",
    path: "fassets/stronger.mp3",
  ),
  // example project 2
  SongLibrary(
    name: "Good Morning",
    length: "3:30",
    path: "fassets/good_morning.mp3",
  ),
];