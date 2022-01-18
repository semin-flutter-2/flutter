import 'package:image_search/domain/model/picture.dart';

class PictureResult {
  PictureResult({
    required this.total,
    required this.totalHits,
    required this.pictures,
  });

  late final int total;
  late final int totalHits;
  late final List<Picture> pictures;

  PictureResult.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalHits = json['totalHits'];
    pictures = List.from(json['hits']).map((e) => Picture.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['totalHits'] = totalHits;
    _data['hits'] = pictures.map((e) => e.toJson()).toList();
    return _data;
  }
}
