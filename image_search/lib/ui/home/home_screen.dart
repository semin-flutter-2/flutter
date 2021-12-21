import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_search/data/fake_data.dart';
import 'package:image_search/data/pixabay_api.dart';
import 'package:image_search/model/picture_result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Picture> _pictures = [];

  final _api = PixabayApi();
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 한번 해야 하는 코드
    _showResult('iphone');
  }

  @override
  void dispose() {
    // 메모리 해제
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _showResult(String query) async {
    List<Picture> pictures = await _api.fetchPhotos(query);
    setState(() {
      _pictures = pictures;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 검색'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  _showResult(_textEditingController.text);
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children:
                  _pictures.map((e) => Image.network(e.previewURL)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
