import 'package:image_search/model/picture_result.dart';

abstract class PictureRepository {
  Future<List<Picture>> fetch(String query);
}
