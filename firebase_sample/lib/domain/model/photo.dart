class Photo {
  Photo({
    required this.url,
    required this.title,
    required this.uploadRef,
  });
  late final String url;
  late final String title;
  late final String? uploadRef;

  Photo.fromJson(Map<String, dynamic> json){
    url = json['url'];
    title = json['title'];
    uploadRef = json['uploadRef'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['title'] = title;
    _data['uploadRef'] = uploadRef;
    return _data;
  }
}