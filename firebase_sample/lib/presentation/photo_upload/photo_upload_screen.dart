import 'dart:io';

import 'package:firebase_sample/presentation/photo_upload/photo_upload_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PhotoUploadScreen extends StatefulWidget {
  PhotoUploadScreen({Key? key}) : super(key: key);

  @override
  State<PhotoUploadScreen> createState() => _PhotoUploadScreenState();
}

class _PhotoUploadScreenState extends State<PhotoUploadScreen> {

  final ImagePicker _picker = ImagePicker();

  XFile? _xFile;

  final titleTextController = TextEditingController();

  @override
  void dispose() {
    titleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PhotoUploadViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('사진 업로드'),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              if (image == null) {
                // 취소
              } else {
                // 사진 선택
                setState(() {
                  _xFile = image;
                });
              }
            },
            child: SizedBox(
              width: double.infinity,
              height: 300,
              child: _xFile == null ? Placeholder() : Image.file(File(_xFile!.path)),
            ),
          ),
          TextField(
            controller: titleTextController,
          ),
          ElevatedButton(
            onPressed: () {
              if (_xFile != null) {
                viewModel.uploadPhoto(_xFile!.path, titleTextController.text);
              }
            },
            child: Text('업로드'),
          ),
          if (viewModel.isUploading) Row(
            children: const [
              CircularProgressIndicator(),
              Text('업로드 중 .....'),
            ],
          ),
        ],
      ),
    );
  }
}
