import 'package:flutter/material.dart';
import 'package:image_search/data/photo_api.dart';

class PhotoApiProvider extends InheritedWidget {
  final PhotoApi api;

  const PhotoApiProvider({
    Key? key,
    required Widget child,
    required this.api,
  }) : super(key: key, child: child);

  static PhotoApiProvider of(BuildContext context) {
    final PhotoApiProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoApiProvider>();
    assert(result != null, 'No PhotoApiProvider found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(PhotoApiProvider oldWidget) {
    return true;
  }
}
