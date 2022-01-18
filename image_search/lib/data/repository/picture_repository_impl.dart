import 'package:image_search/data/data_source/remote/picture_remote_data_source.dart';
import 'package:image_search/domain/repository/picture_repository.dart';
import 'package:image_search/domain/model/picture.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureRemoteDataSource _dataSource;

  PictureRepositoryImpl(this._dataSource);

  @override
  Future<List<Picture>> fetch(String query) {
    return _dataSource.fetchPhotos(query);
  }
}
