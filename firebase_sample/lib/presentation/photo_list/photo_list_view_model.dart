import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/domain/model/photo.dart';

class PhotoListViewModel {
  final photosRef =
      FirebaseFirestore.instance.collection('photos').withConverter<Photo>(
            fromFirestore: (snapshot, _) => Photo.fromJson(snapshot.data()!),
            toFirestore: (photo, _) => photo.toJson(),
          );

  final photos = [
    // Photo(
    //   url:
    //       'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/is/2020/03/26/71994cd7-c4ae-4d4a-80f9-701b6f2488c5.jpg',
    //   title: 'test',
    //
    // ),
    // Photo(
    //   url:
    //       'https://thumbnews.nateimg.co.kr/view610///news.nateimg.co.kr/orgImg/is/2020/03/26/71994cd7-c4ae-4d4a-80f9-701b6f2488c5.jpg',
    //   title: 'test',
    // )
  ];
}
