class Photo {
  final String thumbnailUrl;

  Photo({this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> data) {
    return Photo(
      thumbnailUrl: data['tcover'] as String,
    );
  }
}