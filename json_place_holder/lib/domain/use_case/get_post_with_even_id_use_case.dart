import 'package:json_place_holder/domain/model/post.dart';
import 'package:json_place_holder/domain/repository/post_repository.dart';

class GetPostWithEvenIdUseCase {
  final PostRepository _postRepository;

  GetPostWithEvenIdUseCase(this._postRepository);

  Future<List<Post>> call(int page) async {
    final List<Post> posts = await _postRepository.getPosts(page);
    return posts
        .where((e) => e.id % 2 == 0)
        .toList();
  }
}
