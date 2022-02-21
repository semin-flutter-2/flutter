import 'package:firebase_sample/domain/model/photo.dart';
import 'package:firebase_sample/presentation/photo_list/components/photo_item.dart';
import 'package:firebase_sample/presentation/photo_list/photo_list_view_model.dart';
import 'package:firebase_sample/presentation/photo_update_delete/photo_update_delete_screen.dart';
import 'package:firebase_sample/presentation/photo_upload/photo_upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class PhotoListScreen extends StatelessWidget {
  PhotoListScreen({Key? key}) : super(key: key);

  final viewModel = PhotoListViewModel();

  @override
  Widget build(BuildContext context) {
    // final viewModel =

    return Scaffold(
      appBar: AppBar(
        title: const Text('사진 리스트'),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhotoUploadScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return FirestoreListView<Photo>(
      query: viewModel.photosRef,
      loadingBuilder: (context) => const CircularProgressIndicator(),
      errorBuilder: (context, error, stackTrace) => ListTile(
        title: Text(error.toString()),
        subtitle: Text(stackTrace.toString()),
      ),
      itemBuilder: (context, snapshot) {
        Photo photo = snapshot.data();
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PhotoUpdateDeleteScreen(snapshot.id, photo)),
            );
          },
          child: PhotoItem(photo),
        );
      },
    );
  }
}
