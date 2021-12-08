import 'package:flutter/material.dart';
import 'package:kakao_t_ui_exam/model/menu.dart';

class DetailScreen extends StatelessWidget {
  final Menu menu;

  const DetailScreen({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.title),
      ),
      body: Center(
        child: Hero(
          tag: menu.imageUrl,
          child: Image.network(menu.imageUrl),
        ),
      ),
    );
  }
}
