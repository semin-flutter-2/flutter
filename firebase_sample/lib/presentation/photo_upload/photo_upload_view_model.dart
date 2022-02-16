import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/domain/model/photo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhotoUploadViewModel {
  final photosRef =
      FirebaseFirestore.instance.collection('photos').withConverter<Photo>(
            fromFirestore: (snapshot, _) => Photo.fromJson(snapshot.data()!),
            toFirestore: (photo, _) => photo.toJson(),
          );

  // 2. URL 얻기
  Future<String> _getDownloadURL(String ref) async {
    String downloadURL =
        await FirebaseStorage.instance.ref(ref).getDownloadURL();

    return downloadURL;
  }

  // 1. 파일 업로드
  Future<String?> _uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      final ref =
          'uploads/${FirebaseAuth.instance.currentUser!.uid}-${DateTime.now().millisecondsSinceEpoch}.${filePath.split('.').last}';
      await FirebaseStorage.instance.ref(ref).putFile(file);

      final downloadUrl = await _getDownloadURL(ref);

      print('!!!!!!!!!');
      print(downloadUrl);
      return downloadUrl;
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      return null;
    }
  }

  // 3. DB 업로드
  Future<void> _addTitle(String url, String title) async {
    try {
      await photosRef.add(Photo(url: url, title: title));
    } catch (e) {
      // 에러
      print('add Title 실패 ${e.toString()}');
    }
  }

  Future<void> uploadPhoto(String filePath, String title) async {
    // 1. 파일 업로드 -> URL 얻기
    final downloadUrl = await _uploadFile(filePath);

    // 2. DB 작성
    if (downloadUrl != null) {
      await _addTitle(downloadUrl, title);
    } else {
      // 에러처리~~
    }

  }
}
