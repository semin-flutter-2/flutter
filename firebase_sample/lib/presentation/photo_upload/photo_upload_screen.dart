import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadScreen extends StatefulWidget {
  PhotoUploadScreen({Key? key}) : super(key: key);

  @override
  State<PhotoUploadScreen> createState() => _PhotoUploadScreenState();
}

class _PhotoUploadScreenState extends State<PhotoUploadScreen> {
  final ImagePicker _picker = ImagePicker();

  XFile? _xFile;

  @override
  Widget build(BuildContext context) {
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
          TextField(),
          ElevatedButton(
            onPressed: () {},
            child: Text('업로드'),
          ),
        ],
      ),
    );
  }
}
