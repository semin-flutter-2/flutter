import 'package:json_place_holder/data/data_source/remote/post_remote_data_source.dart';
import 'package:json_place_holder/domain/model/post.dart';
import 'package:json_place_holder/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource _dataSource;
  final int pageLimit = 10;

  PostRepositoryImpl(this._dataSource);

  @override
  Future<List<Post>> getAllPosts() {
    return _dataSource.getAllPosts();
  }

  @override
  Future<List<Post>> getPosts(int page) async {
    return await _dataSource.getPosts(page, pageLimit);
  }
}
