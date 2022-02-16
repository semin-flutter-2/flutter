import 'package:firebase_sample/presentation/photo_list/components/photo_item.dart';
import 'package:firebase_sample/presentation/photo_list/photo_list_view_model.dart';
import 'package:firebase_sample/presentation/photo_upload/photo_upload_screen.dart';
import 'package:flutter/material.dart';

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
    return ListView(
      children: viewModel.photos.map((e) => PhotoItem(e)).toList(),
    );
  }
}
