class Photo {
  final String previewURL;

  Photo({
    required this.previewURL,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      previewURL: json['previewURL'],
    );
  }
}
