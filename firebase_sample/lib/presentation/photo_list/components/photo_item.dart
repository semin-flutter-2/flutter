import 'package:firebase_sample/domain/model/photo.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;

  const PhotoItem(this.photo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          photo.url,
          width: double.infinity,
          height: 500,
          fit: BoxFit.cover,
        ),
        Text(photo.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
