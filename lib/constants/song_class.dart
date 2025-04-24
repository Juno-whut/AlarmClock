class SongLibrary {
  final String length;
  final String name;
  final String path;

  SongLibrary({
    required this.length,
    required this.name,
    required this.path,
  });

  factory SongLibrary.fromJson(Map<String, dynamic> json) {
    return SongLibrary(
      length: json['length'],
      name: json['name'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'length': length,
      'name': name,
      'path': path,
    };
  }
}
