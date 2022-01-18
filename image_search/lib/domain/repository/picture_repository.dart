import 'package:image_search/domain/model/picture.dart';

abstract class PictureRepository {
  Future<List<Picture>> fetch(String query);
}
